From: David Binderman <dcb314@hotmail.com>
Subject: gpio/gpiolib-acpi.c:559: pointless test ?
Date: Tue, 7 Apr 2015 10:27:38 +0000
Message-ID: <DUB128-W81974691C87CB9F27B504B9CFD0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from dub004-omc4s9.hotmail.com ([157.55.2.84]:63194 "EHLO
	DUB004-OMC4S9.hotmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750993AbbDGKcm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 06:32:42 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello there,

[linux-4.0-rc7/drivers/gpio/gpiolib-acpi.c:559]: (style) Checking if un=
signed variable 'pin' is less than zero.

=A0=A0=A0=A0=A0=A0=A0 if (pin < 0) {

but

=A0=A0=A0=A0=A0 unsigned pin =3D agpio->pin_table[i];

Regards

David Binderman

 		 	   		  --
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
