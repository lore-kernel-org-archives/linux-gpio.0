Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964886;
	b=L5Yswvm6gg5sl8jdchmR6INtrgQtQdCPNgRerPY7WHfhE4bL7CiK0wIVv7h2Loxo3usq
	 +Tj9MRa1q3ecoIC6g00vLbBzN5v4JvbpXc4wvbe3dmf8b+bVxwHRW0SZh7V6dnW5HgLBz
	 whTcD+iLt3wJViuI9+q8/V4vijWL41QxxjlvqfMGiwxll5DktNKEJs/5e2jhtvokpfvpy
	 bP8q/FzA7lGHeouT9HQhwWbOx63agIiv+UALHGemTMCgi7dKHWJi+K9NvErIz2oY/EnQO
	 w11BQCDN2NG+ZFOCrF3gqDBJG9RwPK+LZhLFZEtNudE6B2OZBQdaj20prFeNhYvixKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=;
	b=IIEGz2oPe6K9r8zII9fa2/6tJ88PS9ryo7nxN1ybgVv10VJ4E03QYschZK5MQj99pJ5w
	 LtTnOIDyZA6rSFl7lYJxWkcJAcAELsgGRtgO5bRJcv8yPauX95H0QprrsANXNS7bWw6z9
	 cZ2bQwMT0R14u2opFDqPvZRT41XTBYrwOPuQb0QQleURQHyZ/O2nBVquIqlPaVM9QNLRV
	 hUPTLWBwBvJWOR5wwlIFWA5iCyZijUXt8yth85evEV1Aw7bB4z1qN57e8mgRk3d323KCX
	 zsi3I1L2M2TZQn9xrlj5MOHdTZMbLCfW9vN4Lay61n9d62DONaJOVOSvmKsz4nxRndA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClVoZFyJ;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C84E606D81F
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 11:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C84E606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClVoZFyJ
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67583c777abso618175d50.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 03:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964885; x=1794569685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=;
        b=ClVoZFyJkEEyDgJ0fXi7OPN1vdSQqxVaH8KXbNFLWxj03aSLR4Q+UkJc9yGVrBUpBU
         +AydFHydDgizfQOMY2dU0dOkgQe07rS0OPzCvoOYXnahamQqawdMb64hKv56nmY5WHkH
         xuu4Mpcyl7EpJpn2dEx5uuFbyWZ1LlsLUFSs06pbZCOy4cBEyeeDMI5+6W7/eQDGPs67
         LA0cHYZ9/sQQ6fQL7cFE/BLbZP+HcqTKwe4G34Xjy4S8pAP4tGvj6+R7NFW13vgmZ8gO
         klhtJ589ya4sll4IO9U+T6BG/6GxjyERd9MhlB9jMtllbTxtUSrP28qfyJK9FHJWocj5
         47qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964885; x=1794569685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=;
        b=ROVUQnELANlIBh7erk5oPFB7skIy3BiJxNnsUR1o385xf3NMI6Jr4xm6iJJsSXOn/G
         jVS3iBciTjyRWJPbP0JewNXEFS5HPaefEcYEHjYh7Cizatt+4Y1Tz5g6r1X/OxVRGccC
         PCzWBzPwQ2JVxcnpsfDhn2JoPIvoS/Qh2EoD86MHFqyOcvZZESFNVbg31ZQ0vI6gT+QJ
         Y1z51rJedbNRMhx6mpx5UVTBnwLwZ6DQIJ1H9wrCScvIAyiEgbhVouYv1H9NWn5FDVuV
         SvfX13kl0fr4om1+72RSEkVHoYVn/LSFWyPir1dBAz1fwOeK5gS2ROI2ensBwp6/kz8d
         yBCQ==
X-Forwarded-Encrypted: i=1; AL+hErGGf47xMPjSodfnrGchGb3yFBkoExdHgUOqsevMz2EI6T3nfSY1Cvo4eKn2ZebcfaU12rG5trtUGTum@vger.kernel.org
X-Gm-Message-State: APuU4Z+s3iJ7nVaFVA1tGhXNBJpvFD72m5dgEUh0Z7rCN/k2VLra5V3p
	dHcKxNn+RRJthS6iDLA+vmhe+es0F4iU96gxtup4t3HUzZo5k97U/oNe
X-Gm-Gg: AYBFou34ZnecVY64K8KKYCcpiTayDQkco4EQNxmo16pGuD3QDzAmkQ89sMlKCnALTiz
	RcBGk5yGXa1QfWSFjg2K+qmCI5LK//7nLVM5ldvZIVcEyfvbzsI0wb7eeCXNS/yz6PCGQ6QHmsN
	U/HZRZCMBG+T/obduxA76WFM5wu9UpelSRBAftlLMDTr/GAX37LtEnejHfg4p44HoNInFIps4uJ
	ng3zY+lqtaPXTmf+H1u+fWVNmkiibucql6inRCL6qwEWUef/g+AQGoOiavGg4In5eElWlmGxRkX
	1jtedrt2Bgc/wb0mH35c6u67bczia6yYtr0sIUVpLDDuY59fdL9ESsay9MQnbN3SNcnpj7RvwOD
	NWRDQTG8jBM5KWI+4mJp4E3K9ndH+ZwFSHyEfzuWT+6maof1f9QEfWostNKrU4nJRiDaGInmykp
	XHRdOk0ZgDebeKI14e+HKy6gyU+6AiPRODExx/KDrRvHH9h+W79eQTqJJSPt0gJ6fsH4liIyD71
	WcpnFrJkZXSH7SuJlBkx084VpFgCtiiOlxnnDE9HoWYHiyhuh1BY8G2LJT0oHFGdSw7iS3/SoHS
	2OQQfNhUtrd9NQaCLIDxGDZQaOC7Q3BuCoRAYE5ZiIHA4or+TVGG8sbj2OPvryY/RvM/cSzr/a8
	nwDv+QDfcG2pPUTjDDydE3HxuR8lFWZoW7lGZ7TiOG2mNCjE3qNzOVvJ6Fw==
X-Received: by 2002:a53:490e:0:b0:67b:f09e:da89 with SMTP id 956f58d0204a3-67c14249884mr916080d50.10.1793964884851;
        Fri, 06 Nov 2026 03:34:44 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c13540451sm1708137d50.10.2026.11.06.03.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:34:44 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: sunxi: A733: use the two-bit I/O voltage fields
Date: Fri,  6 Nov 2026 08:34:24 -0300
Message-ID: <20261106113425.28936-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/12/26 15:41, Vinicius Pedrosa wrote:
> this follows my question in [1]. Andre asked why not extend the A733 I/O
> bias code to two bits instead of switching it off, so patch 1 does that
> [...]

Please disregard this series, Enzo's v2 supersedes it:
https://lore.kernel.org/all/20261104-a733-pinctrl-v2@gmail.com/

Thanks,
Vinicius
