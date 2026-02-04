#!/bin/bash

###############################################################################
# Terminal Boost - 卸载脚本
# 完全移除 Oh My Zsh、插件、主题和配置
###############################################################################

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

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

# 确认卸载
confirm_uninstall() {
    echo ""
    echo "╔════════════════════════════════════════╗"
    echo "║   Terminal Boost - 卸载工具            ║"
    echo "╚════════════════════════════════════════╝"
    echo ""
    log_warning "此操作将移除以下内容："
    echo "  • Oh My Zsh (~/.oh-my-zsh)"
    echo "  • 所有插件和主题"
    echo "  • .zshrc 配置（会先备份）"
    echo "  • Powerlevel10k 配置 (~/.p10k.zsh)"
    echo ""
    log_info "注意：CLI 工具（bat, eza, fzf 等）不会被卸载"
    echo ""
    read -p "确定要继续吗？(y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log_info "已取消卸载"
        exit 0
    fi
}

# 备份配置
backup_before_uninstall() {
    log_info "备份现有配置..."
    BACKUP_DIR=~/.terminal-boost-backup-$(date +%Y%m%d_%H%M%S)
    mkdir -p "$BACKUP_DIR"

    if [ -f ~/.zshrc ]; then
        cp ~/.zshrc "$BACKUP_DIR/zshrc"
        log_success "已备份 .zshrc 到 $BACKUP_DIR"
    fi

    if [ -f ~/.p10k.zsh ]; then
        cp ~/.p10k.zsh "$BACKUP_DIR/p10k.zsh"
        log_success "已备份 .p10k.zsh 到 $BACKUP_DIR"
    fi

    if [ -f ~/.fzf.zsh ]; then
        cp ~/.fzf.zsh "$BACKUP_DIR/fzf.zsh"
        log_success "已备份 .fzf.zsh 到 $BACKUP_DIR"
    fi
}

# 恢复到 pre-oh-my-zsh 配置
restore_pre_omz_config() {
    log_info "恢复 Shell 配置..."

    if [ -f ~/.zshrc.pre-oh-my-zsh ]; then
        cp ~/.zshrc.pre-oh-my-zsh ~/.zshrc
        log_success "已恢复 .zshrc.pre-oh-my-zsh"
    else
        # 创建基础 .zshrc
        cat > ~/.zshrc << 'EOF'
# 基础 Zsh 配置
# Terminal Boost 已卸载

# 历史记录
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# 自动补全
autoload -Uz compinit
compinit

# 命令提示符
PROMPT='%n@%m:%~%# '
EOF
        log_success "已创建基础 .zshrc"
    fi
}

# 删除 Oh My Zsh
remove_oh_my_zsh() {
    if [ -d ~/.oh-my-zsh ]; then
        log_info "删除 Oh My Zsh..."
        rm -rf ~/.oh-my-zsh
        log_success "Oh My Zsh 已删除"
    else
        log_warning "Oh My Zsh 未安装"
    fi
}

# 删除 Powerlevel10k 配置
remove_p10k_config() {
    if [ -f ~/.p10k.zsh ]; then
        log_info "删除 Powerlevel10k 配置..."
        rm -f ~/.p10k.zsh
        log_success "Powerlevel10k 配置已删除"
    fi
}

# 删除 fzf 配置
remove_fzf_config() {
    if [ -f ~/.fzf.zsh ]; then
        log_info "删除 fzf 配置..."
        rm -f ~/.fzf.zsh
        log_success "fzf 配置已删除"
    fi
}

# 恢复默认 Shell (可选)
restore_default_shell() {
    echo ""
    read -p "是否将默认 Shell 恢复为 bash？(y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        chsh -s /bin/bash
        log_success "默认 Shell 已恢复为 bash（需重新登录生效）"
    else
        log_info "保留 zsh 作为默认 Shell"
    fi
}

# 主函数
main() {
    confirm_uninstall
    backup_before_uninstall
    remove_oh_my_zsh
    restore_pre_omz_config
    remove_p10k_config
    remove_fzf_config
    restore_default_shell

    echo ""
    echo "╔════════════════════════════════════════╗"
    echo "║          🗑️  卸载完成                  ║"
    echo "╚════════════════════════════════════════╝"
    echo ""
    log_success "Terminal Boost 已完全卸载"
    log_info "配置备份位置: $BACKUP_DIR"
    echo ""
    log_info "如需卸载 CLI 工具，请手动执行:"
    echo "  brew uninstall bat eza fzf ripgrep fd tldr thefuck btop autojump"
    echo ""
    log_warning "请重启终端以应用更改"
    echo ""
}

main
