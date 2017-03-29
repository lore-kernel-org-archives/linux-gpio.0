From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add missing signal data to R8A7791 PFC driver
Date: Wed, 29 Mar 2017 21:36:49 +0300
Message-ID: <20170329183649.925242432@cogentembedded.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36719 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932219AbdC2Sgz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2017 14:36:55 -0400
Received: by mail-lf0-f45.google.com with SMTP id x137so14445992lff.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2017 11:36:54 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Hello!

   Here's a set of 2 patches against the 'fixes' branch of Linus Walleij's
'linux-pinctrl.git'.  The patches add support for (1) the HSCIF1 configured to
use signal group E (which is currently broken) and for (2) the DVC_MUTE signal.

[1/2] pinctrl: sh-pfc: r8a7791: add missing HSCIF1 pinmux data
[2/2] pinctrl: sh-pfc: r8a7791: add missing DVC_MUTE signal

MBR, Sergei

