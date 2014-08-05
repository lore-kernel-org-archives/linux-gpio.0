From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Bug] GPIO-Rcar: Driver does not work after Unbind-rebind.
Date: Tue, 05 Aug 2014 03:05:04 +0200
Message-ID: <11539044.7ozDkqgRA7@avalon>
References: <53DB3E53.2000508@jinso.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33989 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752354AbaHEBEh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Aug 2014 21:04:37 -0400
In-Reply-To: <53DB3E53.2000508@jinso.co.jp>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: cm-hiep@jinso.co.jp
Cc: Magnus Damm <damm@opensource.se>, Simon Horman <simon@horms.net>, linux-gpio@vger.kernel.org, Simon Horman <horms@verge.net.au>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, =?utf-8?B?U+mWizEyL+ajruacrOOBleOCkw==?= <kuninori.morimoto.gx@renesas.com>, SH-Linux <linux-sh@vger.kernel.org>

Hello,

On Friday 01 August 2014 16:14:27 =E3=82=AB=E3=82=AA=E3=80=80=E3=83=9F=E3=
=83=B3=E3=80=80=E3=83=92=E3=82=A7=E3=83=83=E3=83=97 wrote:
> Hello,
>=20
> I tested gpio-rcar driver at Linux-upstream-v3.16-rc5 on Lager.
> When I tried to unbind and then rebind the device, error messages occ=
ur.
> Then gpio-rcar did not work and interrupt number did not count up any=
 more.
>=20
> The error messages is showed as below:
> "irq 0, desc: ee005040, depth: 1, cou0
> ->handle_irq():  c005eea0, handle_bad_irq+0x0/0x21c
> ->irq_data.chip(): c05de7f8, 0xc05de7f8
> ->action():   (null)
>     IRQ_NOPROBE set
>   IRQ_NOREQUEST set
> irq 0, desc: ee005040, depth: 1, count: 0, unhandled: 0
> ->handle_irq():  c005eea0, handle_bad_irq+0x0/0x21c
> ->irq_data.chip(): c05de7f8, 0xc05de7f8
> ->action():   (null)
>     IRQ_NOPROBE set
>   IRQ_NOREQUEST set"
>=20
> Please see it and fix this bug.

Could you please detail the procedure to follow to reproduce the proble=
m ?

--=20
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
