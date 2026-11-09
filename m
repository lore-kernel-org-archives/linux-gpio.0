Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261246;
	b=GkuUl2nA1OTkafgsCzQZDHDc47EPmoU7ltAQNkauvbZbffT+FzuhG/I1vmWOI5XmnFS0
	 Pt7KrTIfYq252XPT7W4AzGJbQIWFpbmEvuIHsG2m0jMVt81ACQK3egOds3YO12vojiVYe
	 xE0RXMkSxkPux4O9h4J50D4LD9/DDMpfXyy+JJjyBhIEJZPDF/VwSYasmPCCo2GaiC9yB
	 1TyofIYpfXmd5ZfX4bITq8GTU1Y+6yRhiXOEWVn3nQVJU8L7Y9CGd2pJpGQfE0ihM3oMg
	 wzpOJPAop6ObAxWL7dwyxBXvX/N5i58lluDBjfLgbDhpcHBed3m/xJpHAicLoGzF0yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
	b=InwLRKQHQH4r4f/btCtKS8VvyYT/nFmWqS2dUhLnoz5RU97fdNQn6oXQqVlwdoRbTSWC
	 Bno80LBqv1XTnxlxAAhbbfJV5h2ip13vnnl1hG0FqY7SVykl6Sestcb5jr/8k3G7JLoI5
	 2wbp5lJHzxa8BKHuUT+g5coN3oWCkkysbJ0tQ70IaUtlFcqrCTKdJ43dna5iDmtpTpYah
	 XwfbpsiLalYh/DyxPl3WQz2ayDzZQhUy+JZ94uNZsCeK3ZK2jyDIKvzC8IkTIqejhUlzp
	 0Ct0yLikjYHt2WD4Dkvh05SsZr5MvIvVmvrm7U3d9MXr4fGZgOm7XbpMNAswbyTOJNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JpGYn+ol;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73D8606A326
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 21:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C73D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JpGYn+ol
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67bef25eb92so1951398d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 13:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794261245; x=1794866045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
        b=JpGYn+olxwP6g1AsWQ5JC0dZWj25OdrPJQSEeGtlGaKzWLxHImPHrLKLik/zep9f8E
         x5Sj8992XN7PYjydp9+BkADH+ehh8U6hx02X3mkJN59R02bg2az9+LivqTORKQ3BG0uD
         UTfCQAjQNf8/XheFYBjWMqrpk57fx8dzoOH3S2YJR02Dd2DHy0iF+KbdnHUPf2m+G0oe
         MW0vG3joKSROH7DL4PJ3voUH5wtCNhx+oFeYdNPVgcDSj3fLJaKEh6h9yf2YiFvO5lG/
         9BwhCJnK/YWyqVp5I6S2vaqemkSVhAou0xGHEQRTGSyLeIbZsGsUIyLkJRXQ5klG+D4J
         aKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261245; x=1794866045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
        b=ZJCwQ1B1JmAMnHw9SUQxD4ePQuEaRkncsEwrJwIi2YjofHvsWmSwD/Yk0h8albGh8e
         F7vU8L1YQ6if3fecDgiMrOf4/51ygItOEpUBqNOpONfKmrNK63caa+ojCU6bs/94uSYC
         gvfxkxNMHybmm5joEBD6MR6jOXL5wgPm+EnvKj4yahXELtbW2mbQC+u8HGAefZho0qbr
         cM0Ox/7ED+CJ2gmOHWcM1oFsVknGpkEimgttgYZfFtk3e9kOgeqOOe3nh37QpqiIDe2j
         IJ4No1Zk+85eBuxDYM4SBtS4VTV1TtXkBRS/iUJwliW4VVRzqpRn0LipAN+HKcS/OvAJ
         EEVw==
X-Forwarded-Encrypted: i=1; AL+hErFuUdoT+Q5DTbfLTPe0hhpBSJeOza1CRup9sBdwpd/Xp23pMYz76INr8NZK0qnzESbvl9rmfP5JSccD@vger.kernel.org
X-Gm-Message-State: APuU4Z9U8Q4JXIYvVd06W6TftKR3I2Zd4uJ3zUIywMWwmEXaLxE8ch41
	z3W75uOFoAVcq2XXZnEWJi8V19PGs+5dgslCc3L+E4BvmUTsI6H1pHn9
X-Gm-Gg: AYBFou06Whkd1dCEGysPIbxNlK3byWkwwtG51lDxHWnBqAih4AeGzNaC9BwAgCYun0J
	sYk7WI6DT4jARRQGo9DVIecECpcSWojRJSphu9WBH7vCA/102aMB42d0r/skBWg3fPsFBhWU012
	kcDuL77QcI1pgzKZcdK5LI4h3QFvFII8t+lb6jD4kXdSi2Caola9DyEYekH+vF5beYO8EoM+h4j
	nVFVyFl72GX4r9G6KqAYEVhN5IyLB/7fch5aQjQ9T5zJv1YDsW4OAwmgbL3OMHvYxK4GMkUgYAH
	e2qdfQCzhJJvXtsbPH6XU558PlyOAjW20BDiSR2brbZ/0JfgNlLUQtcH8TBBHi/IL8LkWXzko1G
	4dMPqL+k7bGa71e375AdPVIraU8FHw282D3ICSEMsDhJg7BVrFTw22zqkUDNwZt/gtzKMf0UuYT
	S7mb5lW8xzCwW7kGRKqIij9yjMP/AGNKXvrawVPv/3MHZS+t/UGnUVf477c4E/q1VjdKY8dTMKP
	oHEPDBf+cVknp+N1F8iTH/HU28fdEMBU/J66aWF6oWNxmi35HQGUURuw3XcHvf2B4I5x+4F1mNN
	NuFMKzhLs3I+zx0hyWHth2NIONnk8nkaYj9F+PqTmA0BsSBb
X-Received: by 2002:a05:690e:4505:20b0:677:c21a:ea51 with SMTP id 956f58d0204a3-67c5711cc8fmr277638d50.27.1794261244652;
        Mon, 09 Nov 2026 13:54:04 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a3450sm334827d50.4.2026.11.09.13.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:54:03 -0800 (PST)
Date: Mon, 9 Nov 2026 16:53:52 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: add missing tlmm labels in
 examples
Message-ID: <avJA8HhGiFzC-tJM@rdacayan>
References: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 04:57:25PM +0100, Bartosz Golaszewski wrote:
> Several DT binding documents for Qualcomm TLMM pin controllers define
> the gpio-ranges property in the example node that references the tlmm
> node except that the label is missing. It's harmless as we ignore
> non-existent phandles but for correctness and consistency - add missing
> labels.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml  | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml  | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml    | 2 +-

For the SDM670 portion:

Acked-by: Richard Acayan <mailingradian@gmail.com>
