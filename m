Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3F1BA89B
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729845878; cv=none; b=XKKFXhPvwclwJ48nFftfFfgv+TFeIwZAyY3SgqmEaIMkhLi/7dDnYTCankhTNeCEhEZ2idiaL+MUWgh8caV1JvyXRZ4YC5akoLlk0uMwavlfLCiZyQKKtJIpEl8gZDbY4YlA3tkKoHqAp2Jy+vA71IMoaSiRq4DQ7H1jopchlsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729845878; c=relaxed/simple;
	bh=4qWYQwpgnp9wGLrZEx7eNUmfV0DYrzDjQkJ7UWokRTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEQGaOkq9CDgIKKNhlHmuc+xT2PZmHkPN0Qkr0eXxDLagrF4mk1+qnUeAiO4FTZr/AfGoo9SRCVQeB8CT24Dhay44sqae33qt6ioBX+L6v0xs7BdFPfzddpTe4xVp/QYiIyX7BqEO9qQ/Dxk+OELRW6tdAkY7d3EkLXf/lov7GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YTRZbnzd; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YTRZbnzd"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so15704291fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729845873; x=1730450673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qWYQwpgnp9wGLrZEx7eNUmfV0DYrzDjQkJ7UWokRTI=;
        b=YTRZbnzdqrDhKLNFwlehYySWp8Hrf3WswYrs9cVfhiHZvLwo7xd9TNbQlXYdSA6iGg
         YIc6PoCJpziYe4sII/E7HYA3MmAN24h48eGebqPq71ToPNsGJysyhyhJiZ8k+NN/4Pd6
         jn8zStEsm59zmAwmo9u3pDB1OoV5iNkv5Oomho5PNfwKDTw7tA1/wp4iGcbdaohhLKx1
         BROkfhjtnIN079QsTpDZ0KQNbgzZeuKXXjoGQncf7VTeNX+QlEr7HBytl7h5WZoev5t6
         MmDsMTd3FCC/HYZdU+hDaxl41SJEVLvOqVofomzhq3DuW6XeEmk9+cfSRgLHVWwVIjgH
         1LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729845873; x=1730450673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qWYQwpgnp9wGLrZEx7eNUmfV0DYrzDjQkJ7UWokRTI=;
        b=j6oXcug5SXNHCISIHkALCCO/6RD6C0PPPDhzD61TxAV8aONbnf0q7AStW5WexD9ez5
         kyJZy2uod9c4HUYPFEA00pxh4KFfDwIvl5vxVNxZAIyQYtyWSw9gdTFHT905Z5WRGjgT
         B5XO0YKspg+LO00vUSiKbmp0e9ssR8eSVle3iYw8p0gBMP/cu6qxR0/SzE0ZTeo0yQke
         o3vtqis0n/GOjcy3XjsJWTKGROItXbdBhY5dO6DH9X23I041brysH7UBF3PCNatWYTd7
         zGlRNFU5l3rSOW4w3BXypzLU2/W+rMR24fz1vazh4/83/HO357kLnMvs6+S+RJjBMFu7
         K+dw==
X-Forwarded-Encrypted: i=1; AJvYcCWWxAUb5npN+++FGWbLXJr2zYqpYVu2DTN0tgpR13uC18riJqwop5wUQiQGGXfZAsEdsHEisZ6gpq5V@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4jCGfFnVYNcQKs+EWPC9hgVjEgEPiWdg3howeWy5MZ9+eH3/Z
	lIrJPPIcwcq0cW5iFWkg9QqSTfzSGf6m1rNZu9cIuNB8tlZYoMxBuxkTTAqFgoT2yFtdNXC0aX0
	TNleHk2kGqg1Fer50zvOhwo/fi6JYjI+vggR8kQ==
X-Google-Smtp-Source: AGHT+IGM8SVFA2+ONvrSEBYQyTktV2bCRrYinDhFgybJMVbPg6fS8Zwi9AtvDP/3Lg36VB3SvrKMD5hmMAsbxh0UbD0=
X-Received: by 2002:a2e:4c11:0:b0:2fc:9b6a:a894 with SMTP id
 38308e7fff4ca-2fca8209a92mr22092931fa.17.1729845873286; Fri, 25 Oct 2024
 01:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022064245.22983-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241022064245.22983-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 10:44:22 +0200
Message-ID: <CACRpkdaoVksj5V=wqnf-w+LK8fi_mS5-MXgPHo3Ecsu5mRnd+Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: Add SM8750
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Melody Olvera <quic_molvera@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 8:42=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Document compatible for Qualcomm SM8750 SoC LPASS TLMM pin controller,
> fully compatible with previous SM8650 generation (same amount of pins
> and functions).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij
