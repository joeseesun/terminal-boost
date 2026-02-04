#!/bin/bash

###############################################################################
# Terminal Boost - 终端增强工具一键安装脚本
# 自动安装 Oh My Zsh + 插件 + 现代 CLI 工具 + Powerlevel10k 主题
###############################################################################

set -e  # 遇到错误立即退出

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 日志函数
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

log_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# 检查是否在 macOS 或 Linux
check_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macOS"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="Linux"
    else
        log_error "不支持的操作系统: $OSTYPE"
        exit 1
    fi
    log_info "检测到操作系统: $OS"
}

# 检查并安装 Homebrew (macOS) 或提示安装必要工具 (Linux)
check_package_manager() {
    if [[ "$OS" == "macOS" ]]; then
        if ! command -v brew &> /dev/null; then
            log_warning "未检测到 Homebrew，正在安装..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

            # 配置 Homebrew 环境变量
            if [[ $(uname -m) == 'arm64' ]]; then
                eval "$(/opt/homebrew/bin/brew shellenv)"
            else
                eval "$(/usr/local/bin/brew shellenv)"
            fi
            log_success "Homebrew 安装完成"
        else
            log_success "Homebrew 已安装"
        fi
    else
        log_info "Linux 系统，请确保已安装 apt/yum/pacman 等包管理器"
    fi
}

# 备份现有配置
backup_configs() {
    log_info "备份现有配置文件..."

    if [ -f ~/.zshrc ]; then
        cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
        log_success "已备份 ~/.zshrc"
    fi

    if [ -f ~/.p10k.zsh ]; then
        cp ~/.p10k.zsh ~/.p10k.zsh.backup.$(date +%Y%m%d_%H%M%S)
        log_success "已备份 ~/.p10k.zsh"
    fi
}

# 安装 Oh My Zsh
install_oh_my_zsh() {
    if [ -d ~/.oh-my-zsh ]; then
        log_warning "Oh My Zsh 已安装，跳过"
        return
    fi

    log_info "安装 Oh My Zsh..."
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    log_success "Oh My Zsh 安装完成"
}

# 安装 Zsh 插件
install_zsh_plugins() {
    log_info "安装 Zsh 插件..."

    # zsh-autosuggestions
    if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        log_success "zsh-autosuggestions 安装完成"
    else
        log_warning "zsh-autosuggestions 已安装"
    fi

    # zsh-syntax-highlighting
    if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        log_success "zsh-syntax-highlighting 安装完成"
    else
        log_warning "zsh-syntax-highlighting 已安装"
    fi
}

# 安装 CLI 工具
install_cli_tools() {
    log_info "安装现代 CLI 工具..."

    if [[ "$OS" == "macOS" ]]; then
        # 必装工具
        brew install fzf bat eza ripgrep fd tldr thefuck btop autojump

        # 配置 fzf
        $(brew --prefix)/opt/fzf/install --all --no-bash --no-fish
        log_success "CLI 工具安装完成"
    else
        log_warning "Linux 系统请手动安装: fzf bat eza ripgrep fd tldr thefuck btop autojump"
        log_info "参考: https://github.com/sharkdp/bat#installation"
    fi
}

# 安装 Powerlevel10k 主题
install_powerlevel10k() {
    if [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
        log_warning "Powerlevel10k 已安装，跳过"
        return
    fi

    log_info "安装 Powerlevel10k 主题..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    log_success "Powerlevel10k 安装完成"
}

# 配置 .zshrc
configure_zshrc() {
    log_info "配置 .zshrc..."

    # 如果没有 .zshrc，从 Oh My Zsh 模板复制
    if [ ! -f ~/.zshrc ]; then
        cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    fi

    # 修改主题为 Powerlevel10k
    if grep -q "^ZSH_THEME=" ~/.zshrc; then
        sed -i.bak 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
    else
        echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
    fi

    # 配置插件
    if grep -q "^plugins=(" ~/.zshrc; then
        # 替换插件列表
        sed -i.bak '/^plugins=(/,/)/{
            /^plugins=(/{
                c\
plugins=(\
  git\
  autojump\
  zsh-autosuggestions\
  zsh-syntax-highlighting\
  sudo\
  extract\
  web-search\
  copypath\
  copyfile\
  history\
  colored-man-pages\
)
            }
        }' ~/.zshrc
    fi

    # 添加现代工具别名和配置（如果还没有）
    if ! grep -q "# ============================================" ~/.zshrc; then
        cat >> ~/.zshrc << 'EOF'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ============================================
# 现代工具别名
# ============================================
alias cat='bat'
alias ls='eza --icons'
alias ll='eza -l --icons'
alias la='eza -la --icons'
alias lt='eza --tree --icons'
alias grep='rg'

# ============================================
# 快捷命令
# ============================================
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'

# ============================================
# 工具集成
# ============================================
# autojump
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

# thefuck
eval $(thefuck --alias)

# ============================================
# Powerlevel10k 即时提示
# ============================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOF
    fi

    log_success ".zshrc 配置完成"
}

# 设置默认 Shell 为 Zsh
set_default_shell() {
    if [[ "$SHELL" != */zsh ]]; then
        log_info "将默认 Shell 设置为 Zsh..."
        chsh -s $(which zsh)
        log_success "默认 Shell 已设置为 Zsh（需重新登录生效）"
    else
        log_success "默认 Shell 已经是 Zsh"
    fi
}

# 主函数
main() {
    echo ""
    echo "╔════════════════════════════════════════╗"
    echo "║   Terminal Boost - 终端增强工具安装   ║"
    echo "╚════════════════════════════════════════╝"
    echo ""

    check_os
    check_package_manager
    backup_configs
    install_oh_my_zsh
    install_zsh_plugins
    install_cli_tools
    install_powerlevel10k
    configure_zshrc
    set_default_shell

    echo ""
    echo "╔════════════════════════════════════════╗"
    echo "║          🎉 安装完成！                 ║"
    echo "╚════════════════════════════════════════╝"
    echo ""
    log_info "下一步操作："
    echo "  1. 重启终端或执行: source ~/.zshrc"
    echo "  2. 首次启动会运行 Powerlevel10k 配置向导"
    echo "  3. 原配置已备份到 ~/.zshrc.backup.*"
    echo ""
    log_info "已安装的工具："
    echo "  • Oh My Zsh + 11个插件"
    echo "  • Powerlevel10k 主题"
    echo "  • bat (cat 替代), eza (ls 替代), ripgrep (grep 替代)"
    echo "  • fzf (模糊搜索), fd (find 替代), tldr (简化文档)"
    echo "  • thefuck (命令纠错), btop (系统监控), autojump (目录跳转)"
    echo ""
}

main
