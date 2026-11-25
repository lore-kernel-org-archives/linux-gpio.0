Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592389;
	b=ouIa1vW6bY6aJNZlDODMEIX9ubv+dhCSAZN2yjHsXkggQaDO++e4NolWKp+wv+6GBuwC
	 AwgLuetA3FzHtE+ZHkmn8/jVT9yGF63HW6KbSniYTQ0ugiiy59Q+P0Cd1XZqEhJFI66AQ
	 INBm8DIkyqv6SPJjj0YWdUBbJuUmiNumNab80wsKPYI/63RzXY3hJXLQn8R5R4AKL23+3
	 nTVfvBCpKncYPE2+ei2ZjlLY2lEqy4Kfw6+TiM8EC3c2dB8J5jno2Tx1LbgLa8NmZgnfZ
	 /qoDMmFZrugqNHnYaEj9ATbnqhk0lAQ7q/NU8RE8CKXmQPD4Cd2mnmgSXeFQTR3Iuww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592389;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=ThS4InShu4hUZ3Rp8BUX3cJKRp3s6rD/v/JuasiFrEg=;
	b=ZLJok2226Ffu0MMlsMczQxpini30F7LE0zxSuAAib6R15ZaAaGu+7xl8NG6JP4KG+4gB
	 QxVgh31u3T7qPJyLl2wdbK/m8ZRjNxga+Fd9hWIjysFN634ejQfdWeM1ZE0PN4K1Vfb/Z
	 A7alpR62tzXnepiCJ4wtZRGdAhIWjD4LKsGOn979oUw9wnbZ5FdyDvqz9hEko3Hk+y9U1
	 PZIQhHNUVzMFEQ9vGf04y+nyLxVN/CHEYfOzddCcj+dQFD3k1/hFlYdK56XG4Tv+pBxn/
	 HTCEOj5NeaWD3Ra2jb82g9t5jIef6y4Igw7op69ZO1dRohixiffRCrRPKH7ZCeoD+WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NWBfFAfv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043E606A32A;
	Wed, 25 Nov 2026 07:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NWBfFAfv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285A71F000D4;
	Wed, 25 Nov 2026 07:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592388;
	bh=ThS4InShu4hUZ3Rp8BUX3cJKRp3s6rD/v/JuasiFrEg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NWBfFAfvi0wuW6waQ8cyvo8+o2wdh55l7+wYVhJX7XPqXQKXwg8SChmAf96i1JMNu
	 qzJywMbYV1PDBP3C8yNz4+AIG/jyOlnoZ9qpvqOacaEd10kgBrVSwHwkxxKUCh+Rzj
	 +RS8JfZbuTI39cfr2gUFekBrvS7+OAL8bSn5aBK9vf2RK3d7fZB7vGll5MIO+rUXSI
	 c1TZRZvfQaXSE2JesFF/55g3sfCLdVgTwLi5SFNW1rosRb111tP4nMSypsIAUNBKmJ
	 yEg4MxMAO9yhmo098f9wEkvdhHEdZvVqJ/KwEVeOskS2FzYQQd41QI64eULbTq3ZQW
	 yb4yw0N5Mq74w==
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 09/11] dt-bindings: pinctrl: qcom,sm6115-tlmm: add the
 egpio function
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Sean Parker <sean.parker@viasat.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Stanislav Zaikin <zstaseg@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>, 
 Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-9-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-9-34f2c06b2658@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:39:45 +0100
Message-Id: <179559238579.14607.14926385503041137696.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 15:29 +0100, Bartosz Golaszewski wrote:
> The sm6115 TLMM driver supports the egpio function but it's missing from
> the binding. Add it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Same here and in other bindings.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
