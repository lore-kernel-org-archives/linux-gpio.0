From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/1] Add missing signal data to R8A7791 PFC driver
Date: Wed, 29 Mar 2017 21:26:08 +0300
Message-ID: <20170329182608.174116815@cogentembedded.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34067 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932204AbdC2S0O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2017 14:26:14 -0400
Received: by mail-lf0-f52.google.com with SMTP id z15so14299271lfd.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2017 11:26:12 -0700 (PDT)
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

