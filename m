Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA45C433E0
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Mar 2021 14:57:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 543A461983
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Mar 2021 14:57:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbhCWO4c (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 23 Mar 2021 10:56:32 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:16296 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbhCWO4I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 10:56:08 -0400
Date:   Tue, 23 Mar 2021 14:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
        s=protonmail3; t=1616511366;
        bh=3NRozS2wOOZPBp/nd2ffJeNKOkJoGxFqjmK3/rgwHsE=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=mmOZVuk3oPVzaD9EvHDE4CxXQHMuaF1QDi4xT+FyF3wX+M0OZQFuEgQZ1i4zrrJUX
         KizYXC9Qv1/QY1OoJ5ce2DtMg9vUnO7JtVZdkjuJcYI749LCGwcKRYKEJijrNqArr6
         hMf/HkbjIy8FoEzO4pvO5feO7Dd/0UZ/dXZjRh/DHQlEDLjeQ6K/O7Igelpbr5GiKB
         fY2OZv/6LOhKhVq0QDRGsBukxtQEWwMKjwaRTYkINtCdTmVaFHaYf0NwcqgwlQDclL
         hTFga4Nn3SFUUsTFmjn1rfrzvSfNXSmZsXk8UNubE0cP6i0MaiAdmwa5ruj5jFDtxL
         ZFmyxZ4HVCupw==
To:     Jonathan Corbet <corbet@lwn.net>
From:   Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, trivial@kernel.org,
        Bryan Brattlof <hello@bryanbrattlof.com>
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH] Documentation: gpio: chip should be plural
Message-ID: <20210323145509.139393-1-hello@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 Documentation/driver-api/gpio/intro.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/gpio/intro.rst b/Documentation/driver=
-api/gpio/intro.rst
index 94dd7185e76e..2e924fb5b3d5 100644
--- a/Documentation/driver-api/gpio/intro.rst
+++ b/Documentation/driver-api/gpio/intro.rst
@@ -27,7 +27,7 @@ What is a GPIO?
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 A "General Purpose Input/Output" (GPIO) is a flexible software-controlled
-digital signal. They are provided from many kinds of chip, and are familia=
r
+digital signal. They are provided from many kinds of chips, and are famili=
ar
 to Linux developers working with embedded and custom hardware. Each GPIO
 represents a bit connected to a particular pin, or "ball" on Ball Grid Arr=
ay
 (BGA) packages. Board schematics show which external hardware connects to
--=20
2.27.0


