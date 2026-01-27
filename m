Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0536D2DB7B0
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507433; cv=none; b=nvd8RkDRvBuXqtXHaYE7b6lrz0rqBsfQ5FmqSASTXAaXnZhTp7U/4jMHlIPYqsnZw5jl19661WI7SJWG+rLvWuvMKTGj7x+TB5sTCB+FYcBUhvvQna2wlYXV2OUk3xISwl5AcRa9j15B+Vkhm51yU73Psa4tThDfA1WNhavlbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507433; c=relaxed/simple;
	bh=7LwtmF+bVcSCmHj4byAyUrKHq7eeTlgeOzbbwUaPTlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kIkJkNj2xn2VYL0ajrZ01NsnI0xpMQfqgautZiOOgfm/NP7Uq3qElWuvmZtV5n6wzurGShm3+0Jhtte0eQb19jV7rlhtlg7ajAqsQRQ79H2xahiHb7FehdkPicOM3Uyi5qLTfzTAhyeHCUzHwvrvxz/V7qKxwK866dPy9z76R9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xb59y/Go; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xb59y/Go"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39AAC2BCB1
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507432;
	bh=7LwtmF+bVcSCmHj4byAyUrKHq7eeTlgeOzbbwUaPTlg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xb59y/GoDUM6EzFcgaj7NO4++ndX2ObAjyeo9GTE65HysdDbIprpb51PK7LbwJUxE
	 m4z3wwZmpbs1suTL6iZBOixVEON3HxWpObomLH9k7Mbd0O0DssfBz12o+nFihMmiM1
	 WCBec+TklrCcYZMnIV7WXwbx17V/YROM2P7/pB3ZfBzqCScg2Bi2D4sUI639L8vDhe
	 6+li6u+EO0jjrEdYb3HshcEhx+quBMMDkErL59KGXyLNO90inG6ckHls9KfaUa805Z
	 1ZlR+VhMav7G5Zj7XDzLBh9enfyWKdXbodRbo6q3dQAk/m5a9BbNLte0ghGmfNUXHK
	 6A94PmjxQtOyg==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-649278a69c5so5058797d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:50:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIIS3SAy2DbLwdLBQiQ9XF5GeptoeX/SiTM7e22p87zdduygU43d4agY+ljlcv+/TuQ+7cPo+5xLFk@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+zaZsy/mEZsXf0jjD2ZmvHLV0OiLbiQrn6bcFRE7/ueMcWt5
	JBNbMOoJc0nhliQtLIU9Kx61WsowIjXWTlqTALDnCmwDDEPt9vBGQoiOma2BCYuBInGptEfshYc
	lVPncR60Y7x3kqeFXDmx/XcoOtz3Kenw=
X-Received: by 2002:a05:690e:191a:b0:648:170b:7978 with SMTP id
 956f58d0204a3-6498fbf6b67mr593257d50.42.1769507431993; Tue, 27 Jan 2026
 01:50:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-armada3700-usb32_drvvbus0-fix-v1-1-9dcdf68f5fbd@gmail.com>
In-Reply-To: <20260126-armada3700-usb32_drvvbus0-fix-v1-1-9dcdf68f5fbd@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:50:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLmbkKGR2xOEdJK5VsqcdThOUFdcZGK3NhgRGgTfpyi1tA@mail.gmail.com>
X-Gm-Features: AZwV_Qin6FOjSp4sEFtALnimRFKmQnlfD33duU7mgixjZcsnYxytXr13mypUymg
Message-ID: <CAD++jLmbkKGR2xOEdJK5VsqcdThOUFdcZGK3NhgRGgTfpyi1tA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: marvell,armada3710-xb-pinctrl: fix
 'usb32_drvvbus0' group name
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 4:13=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:

> The trailing '0' character of the  'usb32_drvvbus0' pin group got removed
> during converting the bindings to DT schema.
>
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

Patch applied for fixes, k=C3=B6sz=C3=B6n=C3=B6m Gabor!

Yours,
Linus Walleij
