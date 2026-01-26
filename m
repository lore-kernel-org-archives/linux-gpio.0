Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2131533E35D;
	Mon, 26 Jan 2026 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440889; cv=none; b=WTBuQ6PFYYJXvwenY5dl24KbVSNbVLtREShJr22roEXE/l7uI6xuPEHjLwtnk3DImfwlkpjPtkJKCUHhpnPG34n8e3BVEJfMMSlLh3T1sWbGA8KWqjoJD4umkg1ZGO272F0gNqAsEPHneSF0LR7qaIIHM2h4Lf+OCGY2+1fAnwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440889; c=relaxed/simple;
	bh=J1zCgtxR56PXQG5tJF87DgoC3YupltaoGDJkEDail58=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XdL2t4qrT6OOxdr8wl5hIgRpZ2fM+DWqIWGgoVDfATnRhbXIX9jnEoNnc2emc13Sr9jUVJhLw21c6zrU5/dcmYu45ZpHHTL4F9LhoSttRnJ/s3VE5j0jmdxsE6xWeA/iFPilkwWiTqg5ThKuj3gkqcf7rwjPitDhUQTfZ9UY0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rPdgOvOq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rPdgOvOq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 942061A2A54;
	Mon, 26 Jan 2026 15:21:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68EAE60717;
	Mon, 26 Jan 2026 15:21:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BEBF119A8409;
	Mon, 26 Jan 2026 16:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769440884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9e2smv63Xht8CVe/EiSlmcN0tNNdDRJnWGcws+dG6go=;
	b=rPdgOvOqJqnwGv1gKIe0IM5iEqGDcmvVbZKIdu1fxn8VkT+O2rU0e4qzAweV6SF6RdJQBA
	pka+nJw2DPgtMcRzn9eXOPWpPZXDR/huKx4TlF4UhdvMiFKmennm6dQ9peD3j8KNM++oey
	unPPcuQKSv2n5Jjw0BpwRNsTaXUOdZdML1rk1mx2Rp2QfJSgwOaamPJvqbYBNVy0f3hIXF
	nirNsZMCS1P/eF58FSTLctlfmAjmepZBNZaxFeYCewROSq27+MRRUjKehUZ9ZBgGp22rOr
	HES2f/tw28NG9YwEqqVSexQ1CuPX+euCCryXcoNgh6TNAyKqDOPK3NqnqQhtfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Gregory CLEMENT <gregory.clement@bootlin.com>,
  Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>,
  linux-gpio@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: marvell,armada3710-xb-pinctrl:
 fix 'usb32_drvvbus0' group name
In-Reply-To: <20260126-armada3700-usb32_drvvbus0-fix-v1-1-9dcdf68f5fbd@gmail.com>
	(Gabor Juhos's message of "Mon, 26 Jan 2026 16:13:11 +0100")
References: <20260126-armada3700-usb32_drvvbus0-fix-v1-1-9dcdf68f5fbd@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 26 Jan 2026 16:21:22 +0100
Message-ID: <87ms20mmbx.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Gabor,

On 26/01/2026 at 16:13:11 +01, Gabor Juhos <j4g8y7@gmail.com> wrote:

> The trailing '0' character of the  'usb32_drvvbus0' pin group got removed
> during converting the bindings to DT schema.

Ah, missed that one.

>   $ git grep -n usb32_drvvbus v6.18
>   v6.18:Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pin=
ctrl.txt:106:group usb32_drvvbus0
>   v6.18:drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:195:  PIN_GRP_GPIO("u=
sb32_drvvbus0", 0, 1, BIT(0), "drvbus"),
>
>   $ git grep -n usb32_drvvbus v6.19-rc1
>   v6.19-rc1:Documentation/devicetree/bindings/pinctrl/marvell,armada3710-=
xb-pinctrl.yaml:91:                usb2_drvvbus1, usb32_drvvbus ]
>   v6.19-rc1:drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:195:      PIN_GRP=
_GPIO("usb32_drvvbus0", 0, 1, BIT(0), "drvbus"),
>
> Add it back to match the group name with the one the driver expects.
>
> Fixes: c1c9641a04e8 ("dt-bindings: pinctrl: Convert marvell,armada-3710-(=
sb|nb)-pinctrl to DT schema")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
