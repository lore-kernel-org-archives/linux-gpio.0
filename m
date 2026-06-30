Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D36930DEBA;
	Tue, 30 Jun 2026 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830092; cv=none; b=FXkOAeN556BpF5+2hMAKg/6hs5MOwnq74TU82mA72l0rTPyG5axEGPqQEQuKXrCCL8bi77tlQpfFbAQKsXftDo0IUEnnJv7xMtvbHQjv3qn95iEBgfG/B3DYV93/siLxES3Bup0p+nQeMJWkG0mO5tDZFR6JaLDTSAiAlM1tlnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830092; c=relaxed/simple;
	bh=5uy7k2ORk3FAueEJi9GDfDVYkY113Dpg8oKZ/mo9CfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ndSQgfBnxTAlDyhDmUYtYBivgcaPxTBp6xUZ7uwx6IBnqNmmcrbl5L5fQmyqaITEFeq0NAm5t0a86VTzK+Sc53SFEY7WixVaohdDraP0VGnCgjYsDJRXibSZFhv1ZnPJYa8Hpdfi59qSA39g8MLv72PhkH1Y5wsQM2Me/gc08XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCs84pHq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCs84pHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E401F000E9;
	Tue, 30 Jun 2026 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782830091;
	bh=5uy7k2ORk3FAueEJi9GDfDVYkY113Dpg8oKZ/mo9CfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cCs84pHqPZDFzIxRoiUNjJ1vurObDOUEEv7SBzn6rY2orlZIQb/4x+MrqgZc1zNRI
	 jEV+Ca6SRAySIhYCrLSUm4Qs4nC7hwFonKfPiyuW1mc399sMCgBRrzG5VrlhtQPP9E
	 CZaC5lunZiHIfQFO5AuON/dctj+FBYOkZYS3MK73TsNEp95qzDIi4ssHlmK2dqZVeU
	 DXdX3CRyylR5EwQGpR/mGb4siNEizcuLV5zfrkW6bGXfoDTmL1Pf4MYZ2eFBkwjeP5
	 A45NUoSKtrTzsfCpeAKoh3nhYfEVrBc8i+kpNyzVp7YdgAzQtp5+9TE8uWfr/rfnqi
	 mw9h6+KkMv7GA==
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Maulik Shah
 <maulik.shah@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Stephan Gerhold
 <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
In-Reply-To: <CAD++jLk5qmiCTebaor1h4MSRX0mM-oKH-CdbZU9SKq=f3aQVug@mail.gmail.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <CAD++jLk5qmiCTebaor1h4MSRX0mM-oKH-CdbZU9SKq=f3aQVug@mail.gmail.com>
Date: Tue, 30 Jun 2026 16:34:47 +0200
Message-ID: <87pl18qepk.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 30 2026 at 12:42, Linus Walleij wrote:
> I don't know what to do with this hurdle of pin control and irqchip patches,
> luckily it will be Bartosz' problem since he's managing Qualcomm pin
> controllers now :D
>
> I'll be fine with brining the irqchip patches through pin control if an
> irqchip maintainer ACKs them.

The irq chip patches are self contained. So once we have a functional
version I can apply them on top of rc1, tag the lot and merge it into
the irqchip branch. Bartosz can then pull the tag into his branch to
apply the rest.

