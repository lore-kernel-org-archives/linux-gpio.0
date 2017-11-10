From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add Renesas R8A77970 PFC driver
Date: Fri, 10 Nov 2017 20:58:59 +0300
Message-ID: <20171110175859.365490212__3297.38342338732$1510337759$gmane$org@cogentembedded.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:51603 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753114AbdKJSPt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Nov 2017 13:15:49 -0500
Received: by mail-lf0-f68.google.com with SMTP id f134so3698671lfg.8
        for <linux-gpio@vger.kernel.org>; Fri, 10 Nov 2017 10:15:48 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hello!

Here's a set of 2 patches against the 'sh-pfcl' branch of Geert Uyyterhoeven's
'renesas-drivers.git' repo. The patches add support for the R8A77970 PFC (note
that the pin pull-up/down support was removed in the last minute since that
part of the PFC driver has been reworked by Geert -- I will convert my code to
the new pull-up/down API later...

[1/2] pinctrl: sh-pfc: add PORT_GP_CFG_{6|22}() helper macros
[2/2] pinctrl: sh-pfc: add R8A77970 PFC support

MBR, Sergei
