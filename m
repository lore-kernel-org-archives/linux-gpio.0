Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246184;
	b=1IOF/vTMe8tXisIbDjAOumzukzq1ImDG97avxX7BDwahDNTBRZTuVI3AW9/RDogtAivp
	 HcBe1fiwPeyn89jKB+dADqdJUE584qQYFgc8fWQlJg99mzTYtvbUzN8q9BMP/nim0FX6v
	 27bgckQLH2TktxOjfaQ/0rtAtY28VHATiLeX2CbsMsTCjxEh7iyNvZzRw9ssCv/CCRn/X
	 J83chB2CJ3X0NXuTYyr6/JxOLfD5RwwmHOIDnYWh7HwIIHEDJTgxOYAdACKYQGq7gtrLW
	 /BmOxbT5zOM+8FGKA+tjzRZpi5aSueAKyKTo20LkF7fhtLEUfk42sSG6jlKDYtuAm2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
	b=jmqExt6AswSNI2f2yOqCwVuevDLdfswDqyJMaIaVvZLxGPLqHt0356hIT9VfMaNTQu2g
	 X8zb0bbsIOqqiImrABNf6d5snik5bDn4pRV4qbj/eUDFhzEbxmfMe2DZsjCmlJzwGZcZ0
	 ENmJxAoGRyGKeAILvmn0gvg3GvcUPo07tLhNqNxjkz0gIBHThjjCh2YLfDO/mHe+Bgtrz
	 FGhrPz9YcGjGzwVHFngf+3KV0U16zqFDiKTci4vGxB0Cy5CMmpqbAfWftKkXLKw6dtLTv
	 BBuO7n5XFXgRokUUOCGoSS3vbSMZ7MP2GMf9TcFJXcG45CIn+afT003A/IPwhT/rQqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckZoDddc;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25C606A321
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 17:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE25C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckZoDddc
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so798953f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 09:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246182; x=1794850982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
        b=ckZoDddcTDuBB8D2f6vOtjEQlPoWOfaWhUmDEC61PQ0X0I+yEL4gEl5NEH/GGcwKWJ
         m0SWLad/8xv8sXKhB2ex0GoEl/vKHwM4LWi7D4bbNIyr5KUfSAdRJY+CM/A2eRweKoar
         7i0/2AzyZy97qJxXeaOO+fhMRwAPMikx2EC3jEzJADjIUKU5xqX9L+MtbWhs1NWclFTr
         NLmkJ+KaN4LMAT3AIypj3QwrDkVE1vYGvramUDwAix4DzDNmmuiAdd8KkGVC5ROtdDVq
         IPuncVm7K0fdgckXudrURlG7B60nVfPuG4fDg/J4bz7uc0lyfzFoJyKEUW4BvlWXnLTL
         p9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246182; x=1794850982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
        b=ebYjK+2VCF1eMW7UySc3Ubj66qy6XcyBjPJBXS6lyHt1xMmmFD4rWfKAqtxaWsU6mc
         q30/k2X+RuDmBDLBxUoSkBjYrXuMowM1rm2mY8pa838ZW0wpVM3I7nJI6YbTGpGbRl3P
         QO2BHPxLSQhp+NQRy7zPyj/G6DPH6W64c5YYN2/V3xi7QgDyoFV/K67ABGCx4tAO7adG
         eYJaXIpCaVEHsNtiMpuyH2jfjiL3Hwxy1IgAiWCtRpcZBlyPJVTAilyST7uGtufwBVif
         WRjqqqgTR64XuQT+1ebIiJX+fpq8/VD1/d4kp60AtPIo4y3DZuHvXtz+NDBqd4fBZdeY
         AxbQ==
X-Forwarded-Encrypted: i=1; AL+hErFwpjpPb43PgkUPQWJtmxVUDP4rxwU0WwozFhAl6bC9lp2nkmSifAVBq/F+BHXxtDg2LFAv4QXXdoNX@vger.kernel.org
X-Gm-Message-State: APuU4Z8TxCqdHvYrmC4vVxjA2eB5UfvzGw8rIccpmYLXmSyuWIV395JO
	yHjCnRWLzg4k6GF+oB04SZMmIJ5OoBltL38yU5NxDmW2UNtBsLWTnjN2
X-Gm-Gg: AYBFou3xAyhDUJRgnbwrm+JR8ZCGymWjigeVaC4O/hAT+Ni/IV6vjgj5iHdBzwhLQjk
	HTOLAsbB4qdlweR8OjLq0NGIATCpe3qb1piRx8zDUCFCWxxrx62b1TS19b3fzWPFzcB+rzHD4Q2
	of5yHRcieD2WMxTYjSQPJe2M0dav4i3/emU+ioPxWB8JVY93GRm7tnvifdcxjWFtJimL9NDsYtA
	0lcKgjsVwNN/bOoM/l8UrxSiEaYk/K0p8tBxeXjRjI2UVsJRxs6aVY6cA827i0YGXApsJpVD5cJ
	aeh07dSd614wYP60XIhfG89Z0aCMWKy0f17OKdm2LT6/Sil1ULI7J8Y/2ISGEJUTJ3MIoVlAEWa
	eg+7ks8uus3Nn1nYMnLq17UsaYHDZJMa+QbwsuvCTud2N+CvyQPBC0U88MmAs9PkG8Noqknfl/C
	dFTEOGpCftg8CliF00st67a1PDBl8oLZ6CgOnVxIArZLfsO9fPnS5z8SmpdkoyxouLzrcqWVG5X
	okprQ1sIewsaaBNEYAXtpgU1cIhhGU1rHc48iALoMr2mhaAZvBXB1tSFWSmkyB5kWi440+zEQrJ
	a0bTyFzY8Ap4fzTQ2vDrqElJ/Ho=
X-Received: by 2002:a05:6000:38a:b0:48c:72fc:363e with SMTP id ffacd0b85a97d-498309aed15mr286975f8f.44.1794246182227;
        Mon, 09 Nov 2026 09:43:02 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835f175c9sm157557f8f.32.2026.11.09.09.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:43:01 -0800 (PST)
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
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
Date: Mon,  9 Nov 2026 17:42:48 +0000
Message-ID: <20261109174248.2086482-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cdfwfoubvs6dvwojrjhryjejeqcpmtllu2ko7vhjcgxshgvsga@65rliahvcppf>
References: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com> <20261109-halliday-tlmm-v1-1-a181d54214cd@gmail.com> <cdfwfoubvs6dvwojrjhryjejeqcpmtllu2ko7vhjcgxshgvsga@65rliahvcppf>
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

On 09/11/2026 16:43, Bartosz Golaszewski wrote:
> On Mon, Nov 09, 2026 at 12:28:37AM +0000, Stanislav Aleksandrov wrote:
>> +    pinctrl@f100000 {
>> +        compatible = "qcom,halliday-tlmm";
>> +        reg = <0x0f100000 0x300000>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&tlmm 0 0 225>;
>
> make dt_binding_check will not raise an error because it ignores
> non-existent phandles but please make the example correct and add the
> tlmm label to the pinctrl node.

Thanks, I'll add it in v2.

Stanislav
