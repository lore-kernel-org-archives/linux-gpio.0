Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374542;
	b=fuAAujrj1SW/48aUuPoYr0ngJUYCCmnEXCiOiGjSPHhjMhN/1zEgDJ0jJ0NFBGLMoVMT
	 z3+wqD5XYBkfZYWdBLuN4Td7fTyGFiG/R/AIfOVNCsC+A/JL6t5V2l1W3gcURyz5QsWp+
	 VWBUQ+i5U8bGA872eyaftx9K0P5mlJwssMkJPx/xKVRO89LCc9kurWlU6b+I919x7RvTk
	 /8fuwr7dBx+zHfI+sFRwr8nDvd3pSargPRqhiI24FfJU+N28q9YmJ3yzoRYIcYPkmGKSi
	 Z9q1Ebcao6UBDOjY9d/8Sicu0r509rqdM7rw7HIPZTZg9OuGS8QPC1d5LPWEegI2kGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374542;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eQsm+u4m3P1glnm8udwzWVnFP88fQqS4HZ3d8qMuYcc=;
	b=jzUZW0r3T2AQMB2uEFjwqnBtwhVifT2crmDrKGSGM8cEghccYbG/dq0YEGR0TtyShlsM
	 cNsA/N2atwvNN+SzQm6uhpLzvv3WXG3AFvO8oRuOHGAdzEZ37PW+FgNHwCr0DwTWulTdM
	 +94R1ySnk1IlHknTRsGGPZFtq6ihvSjdWMu1j44gfXlbhSVkfzao7VcY06aaOUC41lVqf
	 yShgGDemLF/hRsolLVJ1YGhaKb9cqGfbAz6O1FmrG2vrMhQsEwnX7SfcmCZDan0i1tTf1
	 TU0t7YFfhUswNRlgDAb38/z1oAMt58yuQrK8v91ceZcvLAlVw0oPqIf4FpjfTba2qqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UWGUWEzr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387A1606A32C;
	Fri, 30 Oct 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UWGUWEzr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397B91F00A1F;
	Fri, 30 Oct 2026 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793374541;
	bh=eQsm+u4m3P1glnm8udwzWVnFP88fQqS4HZ3d8qMuYcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UWGUWEzrLmn2s7M44g/JrjvyIPeoCOSANrEkjxxNWoAAYQEAE/iPaxnBZiNwFFmlq
	 XHCT5Ze1mqc1WV+BosRvFWN0jVweMI7hhhvmGZwP1N9M72XfSTNb1MI7veCbpWTgr/
	 VRfmJvKiil/fw3NBhatK/VF2668CctEDoSieYSvdGDIQtwlVvImgI4ug9P5h5gNTwZ
	 Uf9A7EaZLK2+Y155WLLAzYa1ffAG8J0ukOB5FTV3XAqMpuiNwD3Xa9vMTN8mi4t9dX
	 SH6nimXqhUzutRM8vABP5Vc4WhK1+0QKGwN6MVhLYqE1vqZit0rVNTJA2gJG6rtJek
	 29dpVo2e/1CUA==
Date: Fri, 30 Oct 2026 10:35:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 5/8] dt-bindings: pinctrl: Add
 starfive,jhb100-emmc-pinctrl
Message-ID: <179337453707.73219.2801930067903885958.robh@kernel.org>
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
 <20261017052534.115203-6-changhuang.liang@starfivetech.com>
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
In-Reply-To: <20261017052534.115203-6-changhuang.liang@starfivetech.com>


On Fri, 16 Oct 2026 22:25:31 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC eMMC(emmc) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-emmc-pinctrl.yaml | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-emmc-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

