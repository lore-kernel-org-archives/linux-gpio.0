From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v5.2
Date: Tue, 28 May 2019 10:43:53 +0200
Message-ID: <CACRpkdYFqcu=gz57H-+h5C3g_rvD-+XoRTw_A86PKDVA3=rfJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here are a bunch of pin control fixes for v5.2.

The outstanding commits are the Intel fixes that arrived
during the merge window and I got relayed by pull request
from Andy. Apart from that a minor Kconfig noise.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.2-2

for you to fetch changes up to b1fa7d8592c730d1b44536b5cacadeb318d369fd:

  Merge tag 'intel-pinctrl-v5.2-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into fixes
(2019-05-27 11:07:31 +0200)

----------------------------------------------------------------
Pin control fixes for v5.2:
- Interrupt clearing fix for the Intel pin controllers affecting
  touchpads on some laptops.
- Compile Kconfig fix for the STMFX expander pin controller.

----------------------------------------------------------------
Amelie Delaunay (1):
      pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is not defined

Andy Shevchenko (1):
      pinctrl: intel: Use GENMASK() consistently

Kai-Heng Feng (1):
      pinctrl: intel: Clear interrupt status in mask/unmask callback

Linus Walleij (1):
      Merge tag 'intel-pinctrl-v5.2-2' of
git://git.kernel.org/.../pinctrl/intel into fixes

 drivers/pinctrl/Kconfig               |  2 +-
 drivers/pinctrl/intel/pinctrl-intel.c | 45 ++++++++---------------------------
 2 files changed, 11 insertions(+), 36 deletions(-)
