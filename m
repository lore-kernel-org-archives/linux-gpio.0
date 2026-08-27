Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A80B3A2551
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817058; cv=none; b=Em9h9a2mjYZX77O6Oi0ifSvnOZv09GsU4mMT5hwoPp49APqokOwtGqH1KuPeSdzL2Z/1LCOu5EjpLinXRTxt1iHxJs5MGa7hqnfvzIqLN4YJd4wd+n9TLavtU/6OvRf09K44nrulQGk8QD9Kuyr6iX3jAFH3AZTlido/MqT+75E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817058; c=relaxed/simple;
	bh=/yGEffIVb2AqJDTiWtumihhK8BhOW3hi4oRosz9adas=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d84FEQi39x83Q4hSmdVIB7luWa0TzM3sWLc2ChuMQBki5/ukA359AvXhaOJtwIF8ynERMGm1CpNSwbdEWuLGScfiDChw6BtD6kEbs0r2DKq1+MNo94sxlsMzzfnTL9Gz+UPYPawL5zZIfCXIHi8aTBiy74AYFc6wTS/YUxib/8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9ydyh6Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9ydyh6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0E31F0155E
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 07:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787817057;
	bh=/yGEffIVb2AqJDTiWtumihhK8BhOW3hi4oRosz9adas=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=d9ydyh6Z1Oo0JNZR6mfaIDqz/kOMSVllcGNpB6gKew1vcgYf8e5ECRsHviAI9DSzn
	 TuwFocCEJsRuSVIE5wGjIe8YRuYlX8GqQ8R4XwYzZATEzG8DJlj9pD3KFAIAvt+loU
	 praeYlVJ4bgkVKrYArYdv3yG+pkaAKL8zbqxh8fsgNvULo91AdpyipG2tW7H2+Atnn
	 Ub4w4ylfpKzndHWsVshhnZo3JyfmPhUMu12gsBr/1eFU1uKe5oMWJYeBXmRDkEsR5K
	 AKTl4bXaIVUdxul48cDrn/ALtRWakpmuNI2aJuRIFX1Aupjyy1XeMr7Rk3Wh+usk4W
	 9j2h0K7k68qLw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so2056631e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 00:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqf7ThPa4oM+rXeg6gW7BskYkh2Rujqq0muVEmJzaeXwap7AoIb1nE4YbgiS6J0XhNC3Fq9eyt3v1z4@vger.kernel.org
X-Gm-Message-State: AFuF++liHFbl8u8SqS2Klye4S1KMTQ4dXHSgR0A6Tllx8ifBUr5rEVy2
	j+dtwgHoosJRqwGV3izWYhxXelelcKGN5ofgazQ9+8KFLX9BG64+YtJvAObeGW8oi2/4HQ0bxbH
	/CuFItXWi7RP8DiLcFIcpkm9XgAV3JpBJMYYqh3smaw==
X-Received: by 2002:ac2:42d1:0:b0:5b4:73f6:1d9f with SMTP id
 2adb3069b0e04-5b4a90bb4a8mr3488516e87.22.1787817055812; Thu, 27 Aug 2026
 00:50:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 00:50:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 00:50:52 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260821-kuno-soc-support-v3-14-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com> <20260821-kuno-soc-support-v3-14-196e2b306368@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 00:50:52 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfumxz2iEZ=vYiGvCoe5+sU2Fdt+2N_77ZgQvJuLADejw@mail.gmail.com>
X-Gm-Features: AcwNN1UU6-WnRzQUnew7Tb3gj-2qznjwfQi-BvrVCswjSCg6fe3o3ZW4Upxhu10
Message-ID: <CAMRc=Mfumxz2iEZ=vYiGvCoe5+sU2Fdt+2N_77ZgQvJuLADejw@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 18:09:07 +0200, Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> said:
> Document the Qualcomm Kuno IDP board and register the "kuno"
> codename in the SoC naming convention schema.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
