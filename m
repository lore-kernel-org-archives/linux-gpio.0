From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO fix for v4.19
Date: Fri, 5 Oct 2018 13:05:59 +0200
Message-ID: <CACRpkdaVEmTDBFgf-fdw9uXJYyQ5DC_uL+agTB1zFVia1hzhuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Greg,

here is a single and hopefully final GPIO fix for the v4.19 series.
Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 7876320f88802b22d4e2daf7eb027dd14175a0f8:

  Linux 4.19-rc4 (2018-09-16 11:52:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.19-3

for you to fetch changes up to 19a4fbffc94e41abaa2a623a25ce2641d69eccf0:

  gpiolib: Free the last requested descriptor (2018-09-18 16:36:05 -0700)

----------------------------------------------------------------
A single GPIO fix:
Free the last used descriptor, an off by one error.
This is tagged for stable as well.

----------------------------------------------------------------
Ricardo Ribalda Delgado (1):
      gpiolib: Free the last requested descriptor

 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
