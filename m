Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206240;
	b=EID9NP0CPk3vjZzYHADBcMyM8kLQsBgI39ZbXwqegpt78+T+zt7KpPjGBwOBmgBFkXp1
	 Hd9taektiCrcRrzp2Faz5wP1g5H7pzfoOEfjZfCcrbomgLi0ve9WUjJOiQt3NmrTA+H+Z
	 Jeyniy5ZG9aAWY+9A1Pud9+Jo+C5bWvH5O5gJOHwv4ECmsxYYESKPTh2mgX1i7qRv6u8X
	 BUmZPCpDxpEdGF81+0jP+pI/yGHc+9b7e6Rkkg/d+BkxHU+DWlz64dmDSqeXOyFeEXraY
	 VwR5jHOWlWoQohpgj5Dee9q60MzJ3sy2aFGERmDIk078KHr9Y5JcQdQwCOFNbofrQ0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
	b=TIYWcWI7EFFovnES28uFWkWnXh55GQsGRBZOEZrC2b3NhIcLT/5k9GS6qlISOjXOV8nZ
	 kJgV8YNty0UsOz+Hz6IXqOaKpkFSiEMrEPn4kfOopDiqMkpDdH837MJ0LTfDDwDkNdjbL
	 e+vZ3j64y9GImTsC89IMtlxhwd15FBGOEZWaWjH9/7hUP9jqWTDVwJegyF9StBe2xlH8H
	 5V1SiCat8sSkckchb7yGDECI0qmy4cGIpY8iJrfgsP/Nfk6xkAhIPdARHGGMMmD3Cbzdn
	 4R6q/c4+k+bbyYxYAH1kLwWEvZZtDyn39G6Zr8N9k+mdjfCKQvMDTMMFRxPq8eUu2iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B7606A32A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 16:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428B7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso8465785e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206239; x=1793811039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=bvVViE7sfBqKWfi/kLDJYlnvzOUXPLQxwi7WE8YcmF6ZlMSeeXt5LVtwTgYjpBwkt8
         SYP3vMcQXr/owFcgMM1gE2QwZ/DTceP96Ogemeuc3wSVYptLjbh5WQ0zOa/QFUl5Bsyv
         t91KeRJRSejTTfSC30ERKT+SYsNtmNlFP19tG7VGrb/Fyrtxkv8HCWTMM4co1xxufiUC
         fsayYomNX2KXae5ip40Tnzxu0+b09pZZ8pnmB2UJbRFHhmlzRF7my1fWETNYJaMtDwI5
         xLbeFqSzSFzkr23lLp9iNBgX8plx3P3KNsPgixIQp18S34Dqr3UjM2Pb0SImAbIC4Wby
         52og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206239; x=1793811039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=hdH55NCBsUO52ODCZyyq7wAY2PuysNyAr+OTxJyBQBcXmrd7C2ffckx/y8UldKt0iT
         cxXlzocuGFYl1is/NAkJWYeIo9eXIob4+J2rmq81fXA39IeAYO1w7jLDe/e4/+6G6Vxv
         vyd7ywk9gwFU8ufOVSXM0irD8aGvJZLtaXxN81BC1DFalmkR6CGa3RfHOGXiv4cGhzg1
         lUcqf4Fo4jzBRVY2Lx5WOs4BU21uGIyi7vEOmXBSPvF70gtoqkqSI3hwefbJfPKfIKOs
         AvmrXIaho2KvrsOIbEa8siLMnQcdlblF1dQcoQKaxBvANkh2ZUK4J4xV+ATYk8xOZVpU
         iirA==
X-Forwarded-Encrypted: i=1; AKwUvByAQyfoYwHkPUU+hPPMm2OfkSCzTEqrkkQX0DDY6/rhC0pcf/Y8zwQEyEs54QtOTJeXId9cH0I9Cm8Z@vger.kernel.org
X-Gm-Message-State: AFq9FYLXfho7eDz9vNswZPT7H6MvlC0B9btTgJ/TiprdjbkDwCA9ryUn
	4T/Lq7FVyMwCegfLQZ7yUcTeUaYPV61wXpPJA1MoI1KMk//yiHir1m57
X-Gm-Gg: AYBFou13O1+K6m23BApGhV5+ATlJcgnL66V3SE6F6DrnzurUs+wEZTEb0IQF0x3dGUg
	tDXUwd7efk8PXHOsSrjmvKJhOL6QB+Lh0/Gv5+uKzTBh+kOFabY1Gi5Xx9ntyyc3uGEWoRXCW0W
	GMAg9FcwKys01F5o5OXSyiey/7Os2Z0qSWdPwFtVKCIKNDTyJHt8COamFtQS9+vvdbztNjrQSSg
	Yi32mK4/z53SMdYMBv3JqExyyDDLIbMggp/JT3Q4VVvT23a3bMg3VBjAlNeN5WE3QbOkKNufLKE
	Xq/oPOI811GSReYJCiP08qYjENs+z23IajUIDLpGZ0aPQIOp0aJj/I/osGxVcbsA4/8ydgurRx8
	DkyCmq2DdVzRqLqy1JFSYzIrJ/0fMfc4FjXHG1D145XZSc2iVqBKjwmSWQxI9fKfy15k971CL4l
	ddyiOZqPvVxeqbasN/qYXhZAtkbdptVP2AT/7SYN2fFQRW03BGhYZI5sEYU1tI/g5o2+F35xV0x
	gSD+pXK5xTca0rl30pLym2kXV0mBdig9GcrgwSO+kwit8ppHeZtDQmhQ3j2by4Hc8+fTdSvfqOx
	5qitW4CxG1Og39hQa/l6aKK+zQnc5HrBnJvCQJh7YJhcOzyz4+T82Q7mm7sILEnEaIXBco3PJkr
	/5M4KFTlwTolJgCyI
X-Received: by 2002:a05:600c:630e:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4a9678bff9cmr62960175e9.29.1793206238343;
        Wed, 28 Oct 2026 09:50:38 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm29895785f8f.12.2026.10.28.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:37 -0700 (PDT)
Message-ID: <6ae227dd.6c7231db.220083.ae75@mx.google.com>
X-Google-Original-Message-ID: <auIn2SfzeFL2CJn-@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:50:33 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Anholt <eric@anholt.net>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
	Aakarsh Jain <aakarsh.jain@samsung.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
References: <20261028120216.2657397-1-robh@kernel.org>
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
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>

On Wed, Oct 28, 2026 at 07:02:12AM -0500, Rob Herring (Arm) wrote:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
> 
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For KPSS:

Reviewed-by: Christian Marangi <ansuelsmth@gmail.com>

-- 
	Ansuel
