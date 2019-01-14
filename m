From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v2 0/2] GPIO: hlwd: Implement IRQ support
Date: Mon, 14 Jan 2019 20:14:48 +0100
Message-ID: <20190114191450.11597-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: linux-gpio@vger.kernel.org

In this version, I addressed some comments from Linus Walleij.
v1: https://lore.kernel.org/lkml/20190113135844.13109-1-j.neuschaefer@gmx.net/


This patchset implements IRQ support for the Hollywood GPIO controller
(Hollywood is one of the chips in the Nintendo Wii game console).

Together with two device tree patches[1], I can use the buttons (via the
gpio-keys driver) and the photoelectric sensor in the disc slot (via
gpio-event-mon).

[1]: https://www.spinics.net/lists/kernel/msg3010459.html

Jonathan Neuschäfer (2):
  gpio: hlwd: Add basic IRQ support
  gpio: hlwd: Implement edge trigger emulation

 drivers/gpio/Kconfig     |   1 +
 drivers/gpio/gpio-hlwd.c | 192 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 192 insertions(+), 1 deletion(-)

-- 
2.20.1
