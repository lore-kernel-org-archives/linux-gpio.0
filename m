From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: [PATCH v2] GPIO support for IT87xx Super-I/O
Date: Mon, 21 Sep 2015 18:24:23 +0200
Message-ID: <1442852664-8948-1-git-send-email-vincent.donnefort@seagate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:35423 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757246AbbIUQYa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2015 12:24:30 -0400
Received: by wicge5 with SMTP id ge5so123437238wic.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2015 09:24:29 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: gnurou@gmail.com, linus.walleij@linaro.org, simon.guinot@sequanux.org, Vincent Donnefort <vdonnefort@gmail.com>

=46rom: Vincent Donnefort <vdonnefort@gmail.com>

This patch is a v2 for the following patch submited by Diego Elio Pette=
n=C3=B2:

   gpio: add support for ITE IT87xx Super I/O GPIO, replacing gpio-it87=
61e

Here's changes brought by Christophe Vu-Brugier since v1:

  - Support for IT8732 Super-I/O.
  - Fix invalid free in it87_gpio_init().
  - Add missing lock initialization.

Diego Elio Petten=C3=B2 (1):
  gpio: add GPIO support for IT87xx, replacing gpio-it8761e

 drivers/gpio/Kconfig        |  14 +-
 drivers/gpio/Makefile       |   2 +-
 drivers/gpio/gpio-it87.c    | 411 ++++++++++++++++++++++++++++++++++++=
++++++++
 drivers/gpio/gpio-it8761e.c | 230 -------------------------
 4 files changed, 422 insertions(+), 235 deletions(-)
 create mode 100644 drivers/gpio/gpio-it87.c
 delete mode 100644 drivers/gpio/gpio-it8761e.c

--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
