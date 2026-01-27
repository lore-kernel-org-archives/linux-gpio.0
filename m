Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814E2DC34E
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505928; cv=none; b=EbhnTuGK2UnDFfqAtN1C6UYxzEvWJN5C4dmfao24daeqrDwdp6/Iheg9RMA50awmNM4ubxezjLcZSRjnfovznhrG9r7tGJTVXVh+lMEG7DcbV5AKslaqIOm3jdWxQ/nDxYhBYe7f+EQ16/YfimROzDMAJKADHiKBVTvnSDe5tn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505928; c=relaxed/simple;
	bh=4fhNaoxeEqHkgipGOWq15FtPWpaf67z94Gjy73GwHac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjfJTpNxmnG1SVGbGOgFUtfMX3Sxhgp28+C1DbN55uCmuDqbaZhhqJ6rHDi1wGT3ShFVt8jk1XHjt4G26SHoIaIwU3hz+imHq1u19LUAKdx7xLQwlk/ilysS93lGA25bxZGgHMGkiqKSaa0kBy0cWcMJcQ//q4k/JIht0cY2Kh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xql7Hytj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xql7Hytj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45D0C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505927;
	bh=4fhNaoxeEqHkgipGOWq15FtPWpaf67z94Gjy73GwHac=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xql7HytjIomnGYTsyU+yL/RmeJzSAwfYRCSswOLPckmrBUB9YIpSMUl/X9729DuGm
	 8c5WR+EEN94vlIk1jb5NC0skDFoqLBPtDBJQN0ZEiQfESE2BosVrgh9iofMFGXKjXF
	 4MXtweJh+rum68lIDMcNWgJDouo6o5xmfQSHq1ZnMTcsEY2+YrzntGz0M456rtHiJi
	 K0dZvzBerdzbZ9icNgYQ8os6X/ru9bfIQFLRRASdx2DoiCamLH+2iqFa6PcfM0zKtV
	 EuDwZXx/oTg0TgyZCBleRBowWqki1kd+WGxftWQnQhmDcO9LhfelvFcL+xaRohr4Je
	 9WDl/ffGAHtDQ==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64942ebf1a3so5084470d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:25:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0KS7fkBZWPbt47fRJH8l5Q5BqC2Q6l4Vqr89o10Gpsxn3hZXDkgTtVw6q31LAfV2QvaSPlqc6hpJK@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbNAYA57kSJslPj/Ancf8DxLLx2ZpQfA6FyFSmbIsJ5vD3ZJL
	orPxB2FN1dS6tPbfodq1SZLZmxr0L8zkSqMwC9jcbEZ/r5/8hSOqb4Y3xCDmarw70YSZM380WCe
	wDjpM5Rd3/yhYw4YyzO4UoXQEKkj4xGQ=
X-Received: by 2002:a05:690e:130c:b0:646:5127:9d14 with SMTP id
 956f58d0204a3-6498fc68930mr540909d50.79.1769505927330; Tue, 27 Jan 2026
 01:25:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com> <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:25:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLm0vj7ODP6xq=YmCbF2WomKSnY7PAMiSL2zQ-DNUdKfYw@mail.gmail.com>
X-Gm-Features: AZwV_QjVWNP4X4nR8KbNY0bXRJ0Tx9Nx3_diLL7W3D_y2HIVAXBmR108tXoT0LI
Message-ID: <CAD++jLm0vj7ODP6xq=YmCbF2WomKSnY7PAMiSL2zQ-DNUdKfYw@mail.gmail.com>
Subject: Re: [PATCH v5 12/12] pinctrl: stm32: add firewall checks before
 probing the HDP driver
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	jens.wiklander@linaro.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 11:42=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> Because the HDP peripheral both depends on debug and firewall
> configuration, when CONFIG_STM32_FIREWALL is present, use the
> stm32 firewall framework to be able to check these configuration against
> the relevant controllers.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Lean and clean!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
