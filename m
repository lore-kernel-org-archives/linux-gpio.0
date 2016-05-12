From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] last pin control fix for v4.6
Date: Thu, 12 May 2016 15:29:20 +0200
Message-ID: <CACRpkdbK+Bc684UWGG=2UgD4oQRA2gqgX4z4ge_J-GgX1ULe6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

this will be my last pin control fix for this kernel cycle. It's tagged for
stable and only hits a single driver with two added lines so
should be safe. Tested in linux-next.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 02da2d72174c61988eb4456b53f405e3ebdebce4:

  Linux 4.6-rc5 (2016-04-24 16:17:05 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.6-4

for you to fetch changes up to 5305a7b7e860bb40ab226bc7d58019416073948a:

  pinctrl: at91-pio4: fix pull-up/down logic (2016-04-29 11:16:19 +0200)

----------------------------------------------------------------
A single last pin control fix for v4.6:
- The pull up/down logic for the AT91 PIO4 controller was tilted:
  we need to mask the reverse pull when unmasking a pull direction.
  Setting both pull up & pull down is illegal and makes no sense.

----------------------------------------------------------------
Ludovic Desroches (1):
      pinctrl: at91-pio4: fix pull-up/down logic

 drivers/pinctrl/pinctrl-at91-pio4.c | 2 ++
 1 file changed, 2 insertions(+)
