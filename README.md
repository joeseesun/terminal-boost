# 🚀 Terminal Boost

> 一键打造现代化终端环境 - Oh My Zsh + Powerlevel10k + 现代 CLI 工具套装

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Zsh-green.svg)](https://www.zsh.org/)
[![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20Linux-lightgrey.svg)](https://github.com)

Terminal Boost 是一个自动化脚本，帮助你快速配置一个美观、高效、功能丰富的终端环境。告别繁琐的手动配置，一条命令搞定所有！

## 📸 效果展示

安装完成后的终端效果：

> **提示**: 添加你的终端截图到这里，展示：
> - Powerlevel10k 主题效果
> - 语法高亮和智能建议
> - 现代工具（bat、eza）的彩色输出
> - 推荐尺寸: 1200x800 或更大

```bash
# 使用 bat 查看文件（语法高亮）
bat install.sh

# 使用 eza 列出文件（彩色图标）
eza -l --icons

# 使用 btop 监控系统
btop
```

## ✨ 特性

### 🎨 美化增强
- **Powerlevel10k 主题** - 快速、可定制、信息丰富的终端提示符
- **语法高亮** - 实时命令语法高亮
- **智能建议** - 基于历史记录的命令自动补全
- **彩色输出** - man 手册、ls 列表等都支持彩色显示

### 🛠️ 现代工具
| 传统工具 | 现代替代 | 功能增强 |
|---------|---------|---------|
| `cat` | `bat` | 语法高亮 + Git 集成 + 行号 |
| `ls` | `eza` | 彩色图标 + Git 状态 + 树形视图 |
| `grep` | `ripgrep` | 速度提升 10-100x + 智能忽略 |
| `find` | `fd` | 简洁语法 + 并行搜索 + 智能忽略 |
| `man` | `tldr` | 简化文档 + 实用示例 |
| `top` | `btop` | 可视化资源监控 + 鼠标支持 |

### 🔌 实用插件
- **autojump** - 智能目录跳转（`j project` 直达常用目录）
- **fzf** - 命令行模糊搜索（历史、文件、进程等）
- **thefuck** - 自动纠正错误命令
- **extract** - 统一的解压命令
- **web-search** - 终端直接搜索 Google/Stack Overflow
- **copypath / copyfile** - 快速复制文件路径或内容

## 📦 安装内容

安装脚本将为你配置：

1. **Oh My Zsh** - Zsh 配置管理框架
2. **Powerlevel10k** - 现代化主题
3. **Zsh 插件** (11个)
   - zsh-autosuggestions
   - zsh-syntax-highlighting
   - autojump
   - sudo (双击 ESC 添加 sudo)
   - extract
   - web-search
   - copypath
   - copyfile
   - history
   - colored-man-pages
   - git
4. **CLI 工具**
   - bat, eza, ripgrep, fd
   - fzf, tldr, thefuck
   - btop, autojump

## 🚀 快速开始

### 前置要求

- **操作系统**: macOS 或 Linux
  - **macOS**: 10.15+ (自带 Zsh)
  - **Linux**: Ubuntu/Debian、Arch/Manjaro、Fedora/RHEL/CentOS 或其他发行版
- **Shell**: Zsh (macOS 默认已安装，Linux 可能需要手动安装)
- **网络**: 需要访问 GitHub 和包管理器
- **权限**: 需要 sudo 权限安装系统包

### 一键安装

**复制以下命令到终端执行**（已可直接运行）：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/joeseesun/terminal-boost/main/install.sh)
```

或者克隆仓库后安装：

```bash
# 克隆仓库
git clone https://github.com/joeseesun/terminal-boost.git

# 进入目录
cd terminal-boost

# 赋予执行权限并运行
chmod +x install.sh && ./install.sh
```

### 安装过程

1. 脚本会自动检测操作系统
2. 安装 Homebrew（如果是 macOS 且未安装）
3. 备份现有配置文件（`.zshrc`）
4. 安装 Oh My Zsh、插件、主题
5. 安装现代 CLI 工具
6. 配置 `.zshrc`
7. 设置 Zsh 为默认 Shell

### 首次启动

安装完成后，**重启终端**或执行以下命令：

```bash
source ~/.zshrc
```

首次启动会运行 **Powerlevel10k 配置向导**，根据提示选择你喜欢的样式即可。

## 🎯 使用示例

### 现代工具别名

安装后，以下命令会自动使用现代工具：

```bash
# 查看文件内容（带语法高亮）
cat README.md

# 列出文件（带彩色图标）
ls
ll
la

# 树形查看目录
lt

# 搜索文件内容
grep "keyword"

# 快捷命令
c        # 相当于 clear
..       # 相当于 cd ..
...      # 相当于 cd ../..
```

### 智能工具

```bash
# 目录智能跳转
j Downloads    # 跳转到最常访问的 Downloads 目录

# 模糊搜索历史命令
Ctrl+R         # 按下后输入关键词搜索

# 自动纠错（输入错误命令后）
fuck           # 自动纠正上一条命令

# 快速查看命令用法
tldr tar       # 查看 tar 的简化文档

# 统一解压
extract file.zip    # 支持 .zip, .tar.gz, .rar 等所有格式

# 系统监控
btop           # 漂亮的资源监控界面
```

## 🗑️ 卸载

如果想要完全移除 Terminal Boost，**进入项目目录后运行**：

```bash
cd terminal-boost && ./uninstall.sh
```

卸载脚本会：
- 备份当前配置
- 删除 Oh My Zsh 和所有插件
- 恢复到原始 `.zshrc`（如果存在 `.zshrc.pre-oh-my-zsh`）
- 可选择恢复默认 Shell

**注意**: CLI 工具（bat, eza 等）不会被自动卸载，如需卸载请手动执行：

```bash
# macOS
brew uninstall bat eza fzf ripgrep fd tldr thefuck btop autojump

# Ubuntu/Debian
sudo apt remove bat exa fzf ripgrep fd-find tldr thefuck btop autojump

# Arch Linux
sudo pacman -R bat eza fzf ripgrep fd tldr thefuck btop autojump
```

## 📂 配置文件说明

安装后的关键文件：

```
~/.zshrc                    # Zsh 主配置文件
~/.p10k.zsh                 # Powerlevel10k 配置
~/.fzf.zsh                  # fzf 配置
~/.oh-my-zsh/               # Oh My Zsh 安装目录
~/.zshrc.backup.*           # 原配置备份
```

## 🛠️ 自定义配置

### 修改主题

编辑 `~/.zshrc`，修改 `ZSH_THEME` 变量：

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

重新配置 Powerlevel10k：

```bash
p10k configure
```

### 添加/删除插件

编辑 `~/.zshrc`，修改 `plugins` 数组：

```bash
plugins=(
  git
  autojump
  zsh-autosuggestions
  # 在这里添加或删除插件
)
```

### 修改别名

编辑 `~/.zshrc`，在文件末尾添加自定义别名：

```bash
# 自定义别名
alias gs='git status'
alias gp='git push'
```

## ❓ 常见问题

### Q: 安装后主题显示不正确？

A: 需要安装支持 Powerline 字体的终端字体。推荐字体：
- [MesloLGS NF](https://github.com/romkatv/powerlevel10k#fonts)（Powerlevel10k 官方推荐）
- [Nerd Fonts](https://www.nerdfonts.com/)

### Q: 命令找不到 (command not found)？

A: 确保执行了 `source ~/.zshrc` 重新加载配置，或者**重启终端**。

### Q: Linux 上如何安装？

A: 脚本已支持主流 Linux 发行版的自动安装：

**自动支持的发行版**:
- **Ubuntu/Debian**: 使用 apt，自动从 GitHub 下载 bat、eza
- **Arch/Manjaro**: 使用 pacman，所有工具均可通过官方仓库安装
- **Fedora/RHEL/CentOS**: 使用 dnf，部分工具需手动安装

**安装前准备**（所有 Linux 发行版）:

```bash
# Ubuntu/Debian
sudo apt install -y zsh git curl

# Arch Linux
sudo pacman -S --noconfirm zsh git curl

# Fedora/RHEL/CentOS
sudo dnf install -y zsh git curl
```

**其他发行版**: 脚本会提示手动安装工具列表，请参考各工具的官方文档。

### Q: 如何更新工具？

A: 使用 Homebrew 或系统包管理器：

```bash
# macOS - 更新所有工具
brew upgrade

# Oh My Zsh - 更新框架
omz update

# Powerlevel10k - 更新主题
git -C ~/.oh-my-zsh/custom/themes/powerlevel10k pull
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📱 关注作者

如果这个项目对你有帮助，欢迎关注我获取更多技术分享：

- **X (Twitter)**: [@vista8](https://x.com/vista8)
- **微信公众号「乔木新知」**:

<p align="center">
  <img src="https://github.com/joeseesun/terminal-boost/blob/main/assets/wechat-qr.jpg?raw=true" alt="乔木新知公众号二维码" width="300">
</p>

## 📄 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件

## 🙏 致谢

本项目整合了以下优秀开源项目：

- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [fzf](https://github.com/junegunn/fzf)
- [bat](https://github.com/sharkdp/bat)
- [eza](https://github.com/eza-community/eza)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)

---

**享受你的现代化终端体验！** 🎉
