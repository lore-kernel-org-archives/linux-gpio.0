Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592348;
	b=CBt85TDHAm4BJiEaTFLCnUuPGo5QQ0Uwxs2AxqfBMMl+jpjR8EFofj6p3I/mJj6gmU78
	 w57AIvGJBtFUC9sQ0XcSOwwv2wAfEKTjeihuE6ruDxwGAI4dHtWAYk7JNHHi1uepwntm/
	 OgIgOKedwepxScJjlUR4HDDldLl9lxuJ1iFd5X0UwF/6U1avp+b0K2+JDB8K0e6PKWUl7
	 +vflS6ynUPPBWBcCBLreQ+n6gG8BEYTQEv65qd8J3mL/eXBHpi7PSwUf6tQZk+bXJQTsv
	 lgGShSq+urqj8LOSSvM60ljWZRnBpQuA+wTjVkoBauEb4yRYnCD+U0Y0D9t5byxyVtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592348;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=Prm81wKdU/tfzy4k7uCwzU+TrkKQ2Qy+wjdKoQeIJPg=;
	b=anKcdze6M4/7BwElq1CN5FzqYpE/hMgbDr1HGZDQmT1E5E+C4vorfPkX4+ahWqYCCtYZ
	 XJgnNKLZJ8lOx7ywTBazupQTaZkxfwJaLdAGsG5RnXwtksaNw+IAGJKNhR0aHLPtEx84Q
	 kDMeBFByAB8Yc/r9cI8xCAqc2qX7dCRGO05rYiHbsMKU3OvAVMBfm+vrhrA24iMrja5Jh
	 ZNRZ/r43Si+rIT66x5Nd1Xbzx9yNHZvea3FXrLkLH27vsaHGoI4uL8QzdivLhpQLolR8f
	 s5cytbYDoNMO79IVtGOOBedXUc9SEPcdWz8Olgb/yoI1YtPtw9L7gvpvPiMWTihKNhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVkZaA8w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C634606A31E;
	Wed, 25 Nov 2026 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVkZaA8w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337651F000C6;
	Wed, 25 Nov 2026 07:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592347;
	bh=Prm81wKdU/tfzy4k7uCwzU+TrkKQ2Qy+wjdKoQeIJPg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=YVkZaA8wpP7dwEV5SJAZ6hoiX1Ndmil1RgwkCyFJpPeDEim9ZeikzD6vDbI0f2p7Y
	 UL1dgNVq5dVhIQXwxL/UHa5divT6cmxHMjo/9SgCGnDLnHqjeUORzYm7uLPnHdEz3n
	 LRzgDFczpL6dpIX2skSDXphCQIt36/6gy5yAQC8/R/tDIYYlmY9xEKsu6eFij+T7a5
	 HhqHD9RfJMGErEDCObIrRzhjAoRbZohCVie2A5OFtwn3gUsdr+NmIIInzFU8rNxKoF
	 G6CNZ/Q2qFBzojX5TNHhDzu37bUbaLluH3fqp0RDwUtqHdj58UYkKzDrw6ADd2Yuxk
	 EOj8XcYcyPM/w==
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
Subject: Re: [PATCH 08/11] dt-bindings: pinctrl: qcom,sm8250: add the egpio
 function
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
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-8-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-8-34f2c06b2658@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:39:04 +0100
Message-Id: <179559234431.14607.1759939576972877717.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 15:29 +0100, Bartosz Golaszewski wrote:
> The sm8250 TLMM driver supports the egpio function but it's missing from
> the binding. Add it.

You should rather explain here that hardware supports it.

This might conflict with other patches on the list.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
