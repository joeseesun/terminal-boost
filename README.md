# 🚀 Terminal Boost

> 一键打造现代化终端环境 - Oh My Zsh + Powerlevel10k + 现代 CLI 工具套装

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Zsh-green.svg)](https://www.zsh.org/)
[![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20Linux-lightgrey.svg)](https://github.com)

## 为什么需要 Terminal Boost？

如果你正在经历这些痛点：

- ❌ 终端界面单调，信息不够直观
- ❌ 传统命令行工具输出难以阅读
- ❌ 手动配置 Oh My Zsh 太繁琐，插件管理混乱
- ❌ 不知道有哪些好用的现代 CLI 工具
- ❌ 想要提升效率但缺少工具支持

**Terminal Boost 一键帮你解决所有问题！**

✅ **美观** - Powerlevel10k 主题 + 语法高亮 + 智能建议
✅ **高效** - 现代工具替代传统命令（速度提升 10-100x）
✅ **智能** - 自动补全、模糊搜索、目录跳转
✅ **省心** - 一条命令完成所有配置，无需手动调试

## 🚀 一键安装（复制即可运行）

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/joeseesun/terminal-boost/main/install.sh)
```

**仅需 1 分钟**，自动完成：Oh My Zsh + 11 个实用插件 + Powerlevel10k 主题 + 9 个现代 CLI 工具

---

## ✨ 核心特性

### 🎨 美化增强

| 功能 | 效果 |
|------|------|
| **Powerlevel10k 主题** | 快速、可定制、信息丰富的终端提示符 |
| **语法高亮** | 实时命令语法高亮，错误命令变红 |
| **智能建议** | 基于历史记录的命令自动补全 |
| **彩色输出** | man 手册、ls 列表都支持彩色显示 |

### 🛠️ 现代工具替代

告别低效的传统命令，拥抱现代化工具：

| 传统工具 | 现代替代 | 功能增强 |
|---------|---------|---------|
| `cat` | `bat` | 语法高亮 + Git 集成 + 行号 |
| `ls` | `eza` | 彩色图标 + Git 状态 + 树形视图 |
| `grep` | `ripgrep` | 速度提升 10-100x + 智能忽略 |
| `find` | `fd` | 简洁语法 + 并行搜索 + 智能忽略 |
| `man` | `tldr` | 简化文档 + 实用示例 |
| `top` | `btop` | 可视化资源监控 + 鼠标支持 |

### 🔌 实用插件（11 个）

- **autojump** - 智能目录跳转（`j project` 直达常用目录）
- **fzf** - 命令行模糊搜索（历史、文件、进程等）
- **thefuck** - 自动纠正错误命令
- **zsh-autosuggestions** - 智能命令建议
- **zsh-syntax-highlighting** - 实时语法高亮
- **extract** - 统一的解压命令
- **web-search** - 终端直接搜索 Google/Stack Overflow
- **copypath / copyfile** - 快速复制文件路径或内容
- **sudo** - 双击 ESC 添加 sudo
- **colored-man-pages** - 彩色 man 手册
- **git** - Git 命令别名

---

## 📦 安装内容

安装脚本将自动为你配置：

1. **Oh My Zsh** - Zsh 配置管理框架
2. **Powerlevel10k** - 现代化主题
3. **Zsh 插件** - 11 个实用插件
4. **现代 CLI 工具** - bat, eza, ripgrep, fd, fzf, tldr, thefuck, btop, autojump

---

## 🎯 使用示例

### 现代工具（自动替代）

安装后，传统命令自动使用现代工具：

```bash
# 查看文件内容（带语法高亮）
cat README.md          # 自动使用 bat

# 列出文件（带彩色图标）
ls                     # 自动使用 eza
ll                     # 详细列表
la                     # 包含隐藏文件

# 树形查看目录
lt                     # 树形视图

# 搜索文件内容
grep "keyword"         # 自动使用 ripgrep

# 快捷命令
c                      # 相当于 clear
..                     # 相当于 cd ..
...                    # 相当于 cd ../..
```

### 智能工具

```bash
# 目录智能跳转
j Downloads            # 跳转到最常访问的 Downloads 目录

# 模糊搜索历史命令
Ctrl+R                 # 按下后输入关键词搜索

# 自动纠错（输入错误命令后）
fuck                   # 自动纠正上一条命令

# 快速查看命令用法
tldr tar               # 查看 tar 的简化文档

# 统一解压
extract file.zip       # 支持 .zip, .tar.gz, .rar 等所有格式

# 系统监控
btop                   # 漂亮的资源监控界面
```

---

## 📋 前置要求

- **操作系统**: macOS 10.15+ 或 Linux（Ubuntu/Debian、Arch/Manjaro、Fedora/RHEL/CentOS）
- **Shell**: Zsh（macOS 默认已安装）
- **网络**: 需要访问 GitHub 和包管理器
- **权限**: 需要 sudo 权限安装系统包

**Linux 用户**需先安装 Zsh：

```bash
# Ubuntu/Debian
sudo apt install -y zsh git curl

# Arch Linux
sudo pacman -S --noconfirm zsh git curl

# Fedora/RHEL/CentOS
sudo dnf install -y zsh git curl
```

---

## 🔧 安装过程

脚本会自动完成以下步骤：

1. 检测操作系统类型
2. 安装 Homebrew（macOS 且未安装时）
3. 备份现有配置文件（`.zshrc`）
4. 安装 Oh My Zsh、插件、主题
5. 安装现代 CLI 工具
6. 配置 `.zshrc`
7. 设置 Zsh 为默认 Shell

### 首次启动

安装完成后，**重启终端**或执行：

```bash
source ~/.zshrc
```

首次启动会运行 **Powerlevel10k 配置向导**，根据提示选择你喜欢的样式即可。

---

## 🗑️ 卸载

如果想要完全移除 Terminal Boost：

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

---

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

---

## 📂 配置文件说明

安装后的关键文件：

```
~/.zshrc                    # Zsh 主配置文件
~/.p10k.zsh                 # Powerlevel10k 配置
~/.fzf.zsh                  # fzf 配置
~/.oh-my-zsh/               # Oh My Zsh 安装目录
~/.zshrc.backup.*           # 原配置备份
```

---

## ❓ 常见问题

### Q: 安装后主题显示不正确？

A: 需要安装支持 Powerline 字体的终端字体。推荐字体：
- [MesloLGS NF](https://github.com/romkatv/powerlevel10k#fonts)（Powerlevel10k 官方推荐）
- [Nerd Fonts](https://www.nerdfonts.com/)

### Q: 命令找不到 (command not found)？

A: 确保执行了 `source ~/.zshrc` 重新加载配置，或者**重启终端**。

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

---

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
