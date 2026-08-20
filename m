Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A061EEC3;
	Thu, 20 Aug 2026 00:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787187352; cv=none; b=Uej4os+1qBqTS3afR+e/nZjZKj0Cx9IS/+aox0q393t62CtT0fSJVUz+WXauUupQDRcT3fuyrta7dRXydDpOMi+k+S7U57YTrZcRbGhZtdY+alLXAe2YV2wgFgHzJ+QlJLFBaXaBBzcDwvDHRvJipC/8RWpLaUKv3Kkttp+IoMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787187352; c=relaxed/simple;
	bh=F8uE5+iW1viGiOIrseLpQPRRvDJhg9SsIXkCqo9117c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MciPi3rpMI2NZFqwSqDOn5rs/YK4vb/yil9U3xoeZUlHnl6M8hcL5945GJIk4bvzv3eNXXeive1Gq3qH9kBw/dkHWyEy4W5MsIe2EwddCA52l92hxXZY4KvcSMdVECFtODYZ5MxDSYeZtwl3zxCkmJmhE3ye64S8GyjHlZyjabQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Xcif9WKU; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Xcif9WKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1787187342; x=1787446542;
	bh=F8uE5+iW1viGiOIrseLpQPRRvDJhg9SsIXkCqo9117c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Xcif9WKU0ZYw9SScMW/8f4WWX9jURNdjP6sKmaZSnfO0PpNf4pzlsLeclk1Y/LyBt
	 Cn+vmk+Zu5tpvgYyQmLlXUxcr9/BCckGGHOH2IkGS0vfSBEstErjotyMOG3bagZmIl
	 jxh8b0wok75TDROlOq3g7kU9FS08o2KJx8s3rTmIsNDX8wkSgEsgNZ/727RfYoVLN1
	 bGSx8/Yy3L3Jy2An5H6HRwG4XkdGcN0aFBRtD0IIGEpXBi79MYuoOOgPaGmDiENM3U
	 Vb4ccyDZmQ+NAmWe/0aGx/LoW6Piwtoyw+6iRCZ3Re7606AkV96hF08JdZrtTvKbbI
	 qCe1ieOBnT9qQ==
Date: Thu, 20 Aug 2026 00:55:38 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] pinctrl: qcom: Add SM8475 pinctrl driver
Message-ID: <912a1eea-285e-4b61-8173-8878948828ce@proton.me>
In-Reply-To: <befb87e4-3b29-4e97-be6d-7dcc5e826dbe@oss.qualcomm.com>
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me> <20260802-sm8475-tlmm-v2-4-a93e1d1cb53b@proton.me> <befb87e4-3b29-4e97-be6d-7dcc5e826dbe@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 0d3488bdec08cfad6dc78a8b5aa561e9e6cf6797
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/19/26 7:39 AM, Konrad Dybcio wrote:
> This is a whole new driver to accomodate a single change (removing
> function3 - pll_clk_aux from pin 98). I would just add a comment
> somewhere and not bother, especially since IIUC this is a debug
> mux output that doesn't get used in practice

Ack

Regards,
Esteban

