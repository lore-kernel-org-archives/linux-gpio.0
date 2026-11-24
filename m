Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530246;
	b=pqUE9uoMCT23ozgrHpFuc6W/ytL96ZzyP+WKrFd9sp+IbOZ5JHrwH/W9QWh0N/GjQeeR
	 Ykn8n05uES6g3PXCamfkfqHKOqhfGDLBMPJFN94t2uTTP7eSXzS+fz7o56PChJcB7C3KP
	 x7I1NAWv+rpNwP9/CVGc0Z1U27hK2eutAE1t/t7IK0HHG7tZfPsp7LVTWAtj+peErhpkj
	 lVcXna0LqEQ33Z1IljhzxJ3OM1GOz1duxCNAPg7Zpy1V4yTlPGIn0O43oEYCoon3E15KJ
	 JXyrc+RNdWpQBdeKOojPxfEBDWqhTlx8BwliXDsp21ri/QEDxcmPv05iHCcokV8rrCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
	b=URH2aoKkCq3qVO6oaCvGQi1Dk83jdf/yN48a7rllzTeaMyEeuV/Sz1IEMt5/EvAsYQu/
	 KoKPfDnVU+9epvLsy6ECl8nmmnMPASFLCqIOzHgzGmNqaXxBfsaOLWX4vYI4KDrbUsJF2
	 ex8H36uqqgqWaTac/vARl9tpgSizhMtILuM3Fp8irICpuBaDHliTDaDzBNherBpDyhn3h
	 78yGTRpRKqizc6H+DfLkGZBOfRvOFxuis6B6TIMgVwtJjbrOq+7Jw/Jp6GfdphRzx4b2q
	 V94JnfyY1yc1UJUnnqbxPyHMXhWshbTX4gx44u1YSXt4L66XBCSuhAk8VYqfK1YHC0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJXpwd15;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB34606A32D
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB34606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJXpwd15
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50933bdf4bso909534166b.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530245; x=1796135045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
        b=mJXpwd15LM06NObvBG25I4p6y8dwPNFq5cNkKyqHfA8ddIlk1uVMaZcsVBLcfRtCqZ
         Yx+WmXrCx+fx/N4DpX1uWPcHsrX9WVlNyigMDuhn7uAMsJ/CSmqaBilO7c4ANdKhz3SL
         pwx87MGelSHlPrBUv/UTDsdqWt8KEwVP3NHe6HNkqV5HUMIp4aDFM0Rh7e/ZaFvr5bX7
         sjls1tUx/QmTcMxXjq2DCD1gMVDgel03IVZBUII2r0ZXBUkCv0DYhfsoLjmJMTaeiKZg
         DPKlzQg7XgG7Kf6rd9E5DHo8oIJVx6HkM86xdZjzwydyO36mbWJRyIbyvvOum+Oakzqc
         RgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530245; x=1796135045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
        b=F8tY1825icnCoitFanbEoihRH+/xbuDkZ31oph7tQ87SN/Ey7JtkVRVmYQiMcMWyP+
         Tjc04YdiYzN+lE7Jf0wd7E9bDG7HEuoR1zFR32vAZ1k20I0jk08+35ZLNrVtTQjWxKH7
         aj3DJJTDf2uUOg1C1DtNMEBWKeaExQhmwv20goG4sXeOMxst4hECBdV6rLL+Ip9mA7Re
         afA5p8owJlbqXMcRUpIbcZLC2pkzMu3As6mAujQLzGsUZgVGTZtv2Da7aLpzWVlAS5NL
         jB0lTcwXmGxRIFTZ5zZwF3EYaQSzrztc4d4HYFd93LGIoDmD+TEdseCtiPuSs95Rht4K
         qcrQ==
X-Forwarded-Encrypted: i=1; AL+hErETcOckHzNAAMKvgsNUnnS/rbcr548za/qIaL4nXC2qF629buxNn+5sz5S9RZfthI6XOn3/1S88DwWf@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qrpv2tKYgmRVMexeEfNte8luargTiclO5/c9C1s+UmilkK1dl
	ufSgRV0qnl2/TfzL1/8JGjmxEmyxq94Q7ijrfFsCx8gHIEbUyoaK/OhI
X-Gm-Gg: AZFdTZdSOCJLTv9pqLYMtc53FFKD7s9MP+lBh/+j2/CteVGyO79m84IVn2XHtWuMUEV
	zm0mul8G8KS7R2XT97luXDda8PbuqhM1yt1soS7aFyIiR0dRe+OnENd+iGQKBSihs2KOqm7rt5G
	140SEgzr94ySLJ6xiMvIE7U52zpkrrs2E/7jAV4tWHu17U8bag93Q6znvF5Y6Mkhf5Jz7mwFANo
	rXSOwhsW1yEh6Wmg8586uhoUVF61NbNSgJVY78IvS4NmQQ+LWt/glggHEuInKQVoctC5KqDXJON
	IGvd7TIddc9iQOQo80yyHX0lxl+b0Lw8N5Jldps0OMsTSf+JN9Jb88KFwe0axkF+/v5Ux6v+2mP
	qy5Ipyu3qjMq/1fkG5NjIL+vjGJem2U5N8lkIz5u1KHCt7epN5CMHI0hjPRFZZAklfUQa2plnX8
	sbO5JiAU/CKXQsqWld6goJiaTQ+9sYkMBdWyt7GY6Xz+J14M6WAumdiT1qbZrAbAcvwlnOzvHG9
	cekrL//7zaA8oQstjpg/KWxl070DDRk1KiWg7vaMC8oZzwgUgVj3N/FGbKnmoEWmA2D8/1q+gQo
	j6oiV1qjM5ulx/wq0k/vMvMHuqs=
X-Received: by 2002:a17:906:c53:b0:c4c:c62a:b9b3 with SMTP id a640c23a62f3a-c513aaacfccmr893924566b.22.1795530244720;
        Tue, 24 Nov 2026 06:24:04 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe25asm525653466b.11.2026.11.24.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:24:04 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Date: Tue, 24 Nov 2026 14:23:51 +0000
Message-ID: <20261124142351.2137556-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <wkceygbndcdv2ldsemla27mn5dnzdeijowvxpjozee73wyze6r@mlmymb7cehm4>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com> <20261116-halliday-tlmm-v2-2-b4dd502ca142@gmail.com> <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws> <20261123195935.1046144-1-lightofmysoul@gmail.com> <wkceygbndcdv2ldsemla27mn5dnzdeijowvxpjozee73wyze6r@mlmymb7cehm4>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 24, 2026 at 11:35:32AM +0100, Bartosz Golaszewski wrote:
> Here, use this:
>
> static const struct msm_gpio_wakeirq_map halliday_pdc_map[] = {
[...]

Thanks for the map! I have added it in v3:
https://lore.kernel.org/r/20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com

Stanislav
