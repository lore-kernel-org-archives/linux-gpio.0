Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD323A4F2F
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091576; cv=none; b=AbABOpaN2GAD4VkP5cfn+lOFJjmxKWyWKUHvHYAXzTLoGqigFl4Kp5sm9Kd7DUFZMYs5TY6IaSiyFdrHghV+fwI8QYM4rLgqBMMAPPu1RaU1r2F3ySyh7J6kIXzXSFcI8/tQrGt9h0I7Rt50zuwD0PLAaBZSEdWMlxNWYG28Vk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091576; c=relaxed/simple;
	bh=SILCpGRIHC/W12qB/q/82Dndp+3a0ZpKRjjiDJT+tlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNTAYU8YSexUmvbuVND4Kd68UCHTV0shTthu2yEZGWi2kOYYJDOpOXXIkHP+yJlDOUKUtQ1n0mtTdlk/UlwsWcDe1q0SW9bwck+tyyXcvAHNgFOFQCp9xjf7q1P4JcY3AM7p5r4Ym/eQyvTMWC8D7kEAMN3zTh5zxtn1cvrvhSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzQ768da; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzQ768da"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962DD1F00A3D
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786091571;
	bh=7Mhz+OK85u/kn/NZ553pWOOZ48iX6HSDM4hQTwSgW5U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OzQ768daElmWOlg3+21FIIs7TXjrmYfSMkt0+qXKW7braL6u5qH4U+lIeRnwLedsA
	 9lzcvapEu53V3rCtf6zI+LJcleQ2ktnsoOYxN/enTofXHSNWI07KcgOKYa585HYHjt
	 eafdH7vciRN4zoj87trERBF/dEurZewhGgI9pFe5akAJw/n8gt96S8WbqLjJIBoFnM
	 Zg82kuzxR4hugsbOruiKMMZOeAIDKhZBAOstMew8ip2rlSrImxqukWE4uJwYHQ6qeb
	 JOOe54RkgybpuG4NA+VoQ6mAqbz7PGDIX98PafYQwtR73U7Rwx/m0VvUVFJY7LEibw
	 przxSaU32CiKA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aec6360133so2676508e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 01:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoNwuV54HRc40aqcv1nEbq8234cctVmKzJUwYWGwQZ+eWf1ynC5GdHQkPIFHGF8PJyr1RJCkPB//VxT@vger.kernel.org
X-Gm-Message-State: AOJu0YwvCwMsb5T36vkZAwIyK9lXVNdiUtOQXNb4aS5/tSRy0SGgMnLd
	jSzwPhzDzrs1M+4SSZl155HdHB1E+v7CkpAQdNletU1q170wYDtafR+fnD0o+x7uCS7lt/90jtJ
	FeoO9+oTNesf0KC2sBtLjAOQPbWEKl+U=
X-Received: by 2002:a05:6512:304e:b0:5ae:bce4:b696 with SMTP id
 2adb3069b0e04-5b2f4b8873cmr2728006e87.15.1786091570304; Fri, 07 Aug 2026
 01:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr> <20260804-mainline-send-v1-sending-v5-2-149dd4372ac8@alex-min.fr>
In-Reply-To: <20260804-mainline-send-v1-sending-v5-2-149dd4372ac8@alex-min.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 10:32:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLmOD87COHe==Ftsww0axHeo2d_8w1x-gVq19a_0cdNQtQ@mail.gmail.com>
X-Gm-Features: AUfX_myXxwli_66rS13h2JzbRiN0CX1UmYRC462OBlNBA-vZjZOZULR8cFde8WA
Message-ID: <CAD++jLmOD87COHe==Ftsww0axHeo2d_8w1x-gVq19a_0cdNQtQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] pinctrl: qcom: Register functions before enabling pinctrl
To: contact@alex-min.fr, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Lee Jones <lee@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, phone-devel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 8:34=E2=80=AFAM Alexandre MINETTE via B4 Relay
<devnull+contact.alex-min.fr@kernel.org> wrote:


> From: Alexandre MINETTE <contact@alex-min.fr>
>
> pinctrl consumers can request states while the pinctrl core enables the
> controller. On Qualcomm pinctrl drivers this can happen before the SoC
> function list has been registered, which leaves the function table
> incomplete during state lookup.
>
> On APQ8064 this can fail while claiming pinctrl hogs:
>
>    apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map table
>    apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
>    apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22
>
> Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add the
> SoC pin functions, and only then enable the pinctrl device.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>

This is for Bartosz to apply independently if he hasn't already.

FWIW
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
