Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C123101C8
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180692; cv=none; b=Kbmf9IxwGHXNQp2oxAUVmnHnPggwtrbanQr1RgfESW9wo3+hnGw4n10+85E6hwxqnRiHALb4tmfBzb9nTfGy5mBtg8Rek/+I8jwRaYpieBxzS0R3/Y0016SurWEUQ7b2uBYTREgBTafUYp0CsGQYIemmlP/8uKEfYKVP7KeWsdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180692; c=relaxed/simple;
	bh=+GWDGGbtT20VSu+vCSgxyZGvak1PFsiVLn78RBoQ0lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHUIx4jeOYFt7dsLH/MXKwcFL6b8SGZ+9bv4YUE+87mXNk+jU3soui09uacY0noN+Qf5ejRNHqkoqgbHA0gGJHMSJSmA/TDnPfmm+DGyEo2bCOBAZ/Z68879+eOd/mKUp4SFdAXFYtkxEL+/vLUFuC5Pcq7urOwhCxKKgw7qvos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lea+n4Mi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lea+n4Mi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB19F1F0089F
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781180692;
	bh=+GWDGGbtT20VSu+vCSgxyZGvak1PFsiVLn78RBoQ0lQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lea+n4MiGpc3ia1zomqQ656poeaB1nyGP3gj0AHbZIHtnxSC6hJP/+2MBvxcwHaOs
	 CJl1LrUfZh6hYVUxDIUxOnWco4cZQGMA4pnP0TKgQGqRnC+P3mxRnlltRrVEhqNj35
	 YAFWpTh/PvKjJyH3wDvNuO19PCkG7DXO/um/Sm+9/sWpPuTNwWWNnP+E0j0aM3IlPl
	 Qj5Y9QPLfoMo87kmf557TQ9x89lm/WOHjCDHueUzZueNnSx4yV/78C8wfcosNkNLUL
	 3oj/meoKOPd6E46XzEHu0cm871i53XH1t+SlZau0JZ+53CMNRAX5ueYo+4iHp52f1s
	 yuhutDMf/+fyQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa6cdebc33so7247051e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:24:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/w5LG+MDlg5blHOuWF/bbBSNg6XVCRK0u5pW+2ShlDPYYez8LZnYtfFo+qZnIlinpcXC4oyp6F85Jt@vger.kernel.org
X-Gm-Message-State: AOJu0YzUiWtS0bSVWiBmvZ4NnHRgoYQTiSF7KOcziJ/n8nT1TE9l5SkA
	TMgpuDW5h20jshduJAueMD21e9X8LFdyWVbCUe7bCrkDVkLeajfN/zF6Nl7LvZdf3NN1X7h5ILL
	3/9l+6rFJ95hhMGxtb+uhIdO3PBki+xM=
X-Received: by 2002:a05:6512:3985:b0:5aa:6585:1ba4 with SMTP id
 2adb3069b0e04-5ad27fb5d65mr737232e87.41.1781180690702; Thu, 11 Jun 2026
 05:24:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
In-Reply-To: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:24:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=m6++zOfq2gP4-y4N7U6nx1buVM5KMoxWJ_9PM6RVV8A@mail.gmail.com>
X-Gm-Features: AVVi8Cfk_Nb67GqHhEaC43czvNZSfeYaRUO8eNFAOjUIKcFR1-C3mQUmgjkvIvI
Message-ID: <CAD++jL=m6++zOfq2gP4-y4N7U6nx1buVM5KMoxWJ_9PM6RVV8A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: ultrarisc: add DP1000 pinctrl support
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 7:29=E2=80=AFAM Jia Wang via B4 Relay
<devnull+wangjia.ultrarisc.com@kernel.org> wrote:

> This series adds the devicetree schema and the pinctrl driver for the
> DP1000 controller using generic pinctrl bindings.
>
> Compared with v1, this series is narrowed down to the pinctrl binding
> and driver only. v1 patches 1, 2, 3, 5, 7, 8, and 9 (vendor prefix,
> CPU/SoC bindings, DTS files, and defconfig update) are not included in
> v2 and will be sent separately.

This is a very good looking driver so I applied the patches!

If there are any more snags they can certainly be fixed in-tree.

Yours,
Linus Walleij
