Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CD0351C1F
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985559; cv=none; b=l4X5+Mho7M3z052TsJraBeroMbodR3AJNBI1qjwu35whwBKYckkQD7EtYAPlGjwseXXh4Q9o8AIPicAFPgurxMdYCcKFaRKWywdifaK/Q+Fa+maO1NVgi/FbjX5XZB7LF0S/VGi6rQm+jeFduVtkPJXA4o/k9I0wfJcNNsTBb30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985559; c=relaxed/simple;
	bh=fy13KQEvuLTD/Lo2loN/ITnGeHnIFPaaAbYKituuXEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFenqoJB6V3Jl4Th10kbiGGQK9ErYrKX4tq1NZqItseUUII05tWjnO7CRllKSEGqwsZa5q13gDkTheiXnxWSWfCjhasaKQYBYMKGF9b3EgLCj5VYdcnrhZsZYiozsaVM/6XcaZEB+JiexS6EH0UTbWmqmw3k1nQFTUklEsKGWo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLOudbTe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLOudbTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BA3C2BCC7
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985559;
	bh=fy13KQEvuLTD/Lo2loN/ITnGeHnIFPaaAbYKituuXEM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nLOudbTeZ6y6L6hAaGOW3oBaCe49nWLMnKk+uvDMPm/UZr3OHttWsNMNmZiy6D+cZ
	 OO8OgFHlNZfTZk9POi7Fps2C0hPxkcjOraVg4BSAGIxdaJqx/XGh3mqKntJPkPdQNZ
	 +BqkzjcNAM0WIMDsfroSYVx8TY2TDbsVCojurZEoX2t9XuBNDaBi2pxUbQGNSkNuR5
	 qukLuPexF9MhwaiRuJrkpsY7qndrcARVkwxMmhB9tjr0zO7tDM5Bcw9hGfM9WRtiJ0
	 jQqsQTpxAWmK2kH8Wdmxy6WCGaqursUuPEVEvWlEpbQ9v91TYzHYo3tNxcB6CGfjxo
	 3sSV0bjDhRWRw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-393925cb1baso29666001fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:52:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8YSoIhLpiRNg0VTyspExtENB0WO2CUW5yc9SdBA7OmhWw4+a/Cb5D+2AH5cF3Y81IdvGozCdK62pAV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6v9EoOZZWq3PKw5oS9MPo6UaJynZ6zjhEFc3tIZ7LrM+VSkX
	kNT1MaEMmiF187Ayd+XSPX6KdShF5SYr+LVO3f1cuCLRtxYCdg0Nf4kyROgKoEl3RF6G+Fmr+Y7
	qAKXkdypaZeqOX2B3532IsNihbCR/odU=
X-Received: by 2002:a2e:9815:0:b0:393:9b5d:f801 with SMTP id
 38308e7fff4ca-3939b5df982mr29781371fa.15.1777985558239; Tue, 05 May 2026
 05:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504064936.2754570-1-swati.agarwal@oss.qualcomm.com>
In-Reply-To: <20260504064936.2754570-1-swati.agarwal@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:52:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLkent4ecVKsw=Jz=oVvstMH391-Tpkhb7ATwqK9OSQ29A@mail.gmail.com>
X-Gm-Features: AVHnY4Iphv0DR5tfqaVoRpRom3m07D2-njUdmmkx0r5hOdGebq0cUmNRfTzPaR8
Message-ID: <CAD++jLkent4ecVKsw=Jz=oVvstMH391-Tpkhb7ATwqK9OSQ29A@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom: move gpio-hog schema to tlmm-common
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 8:49=E2=80=AFAM Swati Agarwal
<swati.agarwal@oss.qualcomm.com> wrote:

> Qualcomm TLMM-based pin controllers share the same gpio-hog binding
> semantics across multiple SoCs. The gpio-hog pattern currently defined in
> qcom,ipq4019-pinctrl.yaml and qcom,sdm845-pinctrl.yaml are not SOC specif=
ic
> and applies to all TLMM controllers.
>
> Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml s=
o
> that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
> schema duplication.
>
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij
