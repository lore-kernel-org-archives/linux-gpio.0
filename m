Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E545441C305
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142147; cv=none; b=cykZ1CI8MD5ubhTcb+vkxIzqVpj1UKD/aX6/py9J2I/4Krd723PHo7/IuRu4t95R7P08fAWTVAAJFDo2jN/N7/XHo/jyC3mL0DMcUS4CaQ1cz9Dcb02vMws5tcKexj26fo0mZO2OguaEBLhercNfAjavKHb2Bq/lloHpn2EXzvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142147; c=relaxed/simple;
	bh=C5M+Bty5YcRutCvl7AErxTfyp+JxDAgTV17V+hsuaOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0UytXCVA2bzUY/Uk0cm8xAxWxIJTelrECsTxmcsR1IqY1A8LMvhYz0EYcojCl3CUmy0CSjCZAyjcSoBXzdJdy3WbmFCwWNgvQSlRYAnTPgqCOm9AANfb+v4eCYudjWB8Y8oGGlyjkSvk7nMOZl2tgc7EpicQg9dUuvg66WGq+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZW3Nm771; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZW3Nm771"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F0BC2BCB6
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142146;
	bh=C5M+Bty5YcRutCvl7AErxTfyp+JxDAgTV17V+hsuaOM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZW3Nm771/UCnueFf/eUBV1D3yHpkta92iH3jndTPOZAEAylW7z6etVRefddlIJz/C
	 VN7Z5QU5bv8dokHzUrrxNM4iwj7pXSZbooum6uV3auNhuW5F9DRuy0YVn4bNWbE5YO
	 QsX6IRG0lZpstJB7azuGAZTFoi7xYgJgIe4WLGCrVKoyTDWWG71AWbtymfL/ncjU+d
	 0j0WI9r97EeYPeCxIuHrmvN9INmGgiQqXO/8ZYR1cUCVSJX3XwxPwedRGrtIu4wudr
	 AeU3ByoGbp7tJGhv5hABrG8IX5WOH/IN6FkDGne34+QJped0igeqrpmmPNHJzqG4Ci
	 d2yHn7Va1E3Jw==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79907171da2so14943837b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 04:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5d3AzIuZgYjiYFsMW8lvyybWq832BWGFajJg4Jfe7OzF7oIUNt+g53qEsOromgIRGZaBBJ3xrT17v@vger.kernel.org
X-Gm-Message-State: AOJu0YwzrAoNLfCjCWItzWlMAfy6/vPv+Cneo/xiwT8e360zmhUNHxoj
	A5UW+0Elbc/PiaroGYvNC1IGYFNVQR1CMgRxzmcsURgQh17mbjdISD+ROQpYF/kDtNeYNsz6Bbv
	7vzsJjsIfZxznh7rEb2gMGtHkcFc1VXs=
X-Received: by 2002:a05:690c:c4f9:b0:796:4b03:73bd with SMTP id
 00721157ae682-798dd771382mr133874007b3.31.1773142146174; Tue, 10 Mar 2026
 04:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com> <20260306-milos-pinctrl-lpi-v1-2-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-2-086946dbb855@fairphone.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 12:28:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
X-Gm-Features: AaiRm53kS4zQliTIX4Fn5ceGqrudwVM7-RS-_bNOw_f_i9rtyZ-GaueU-4PyAHw
Message-ID: <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: qcom: Add Milos LPASS LPI TLMM
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 3:22=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Add a driver for the pin controller in the Low Power Audio SubSystem
> (LPASS) on the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Patch applied to the pinctrl tree.

The patch is minimal and simple, any remaining issues
can be fixed in-tree.

(If Bj=C3=B6rn yells I will back it out...)

Yours,
Linus Walleij
