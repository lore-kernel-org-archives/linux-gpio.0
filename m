Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374575;
	b=S74387diQC7rm6k2gu8ML+ekPebAGjIk1kpZqmIBRG6wXNtgzrrNeN4fHJD685Q8G161
	 687e2SaxCSuvALL1jdYM7rynJLN3gtMfasiAzItjCteyuKISUvGz4xQWHNpxT2TbpUYco
	 4KIGOz2/IIm64OP9gBwE9Aj+V3XZsrIy44BSsp1bCjFKxHAXteYJxd6w76h0fnpWNRvd8
	 SHgtXHGKNyeTgGIFWVik3+WoIY8LzDgWzHgc6sg9c45fRzaBTTsFU3PGWghe4BQFr7ijW
	 Q0jOaaRFj7zrBlzkuZO2DF2eGKHdrFTAGWk5DsL/eZEGv4NRtskB0KQDMuIrl2UAPbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374575;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1IqOCYo1cm+Sv5dYd0Hc24NePoNXMJLE8UDijkGK7wc=;
	b=OJUfTb9wpChCLs7FfcSSr7bxVF91puoczr0uFtg3L/bsy9vKiD7RyU/k00tnbtVV9Lic
	 ZZcdo4xyC0ANYCEZgnnRjjBGhX1mMEqo6HNQElRDq6AW7Ysugivvo2jdqqkAxinfQcrS3
	 o/By1DUkUuA3/E6D2A1h4k/7YV+ow5IWOx+IrZEKZuA8JXyOdArfYzS0urPetVxNl+FKk
	 Z1Z8nF/7td+do5KCxep8ij4o0020sLzcJD4FBKzu3IO3p/F538Fi/9kdifj3B4asOwA0m
	 9HQsinUYmOJJszzf7rcdaqZXRzFQI5xxhbhM3XzQhcDubGdo+nRGae9mm9Jd7MfHVxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GA8gq1oZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FA3606A31A;
	Fri, 30 Oct 2026 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GA8gq1oZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743DC1F0093A;
	Fri, 30 Oct 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793374574;
	bh=1IqOCYo1cm+Sv5dYd0Hc24NePoNXMJLE8UDijkGK7wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GA8gq1oZtiDp7Y8uhtK7nis5Aw+XyMk4V6YXAo61C6WgUjNom3PPEBPRQYeTQJrOT
	 oxIRWPodBZbAM5T0QomF9MkhGzERBEaQyytCj5ILjlwqQopWtYQ4Fx1ekvbYU0OsxF
	 yU5wzLjiid2nFk3QVfUA0eRxaK4QVEP8st7ml0yeeqM/d1ePTTV3/WJ+CURPk0fVOh
	 V83O5yF4jQY6IK3TjcWXowVQCJbwEM6hjuHAm0cJYZFhnqju5m3BFDWONxGLtrRBzB
	 +HBbtWyfIlN1th8WH9tew+YkCd9BmgtUrT9jSlHRRwPHWiHAstBT/R5AWCLxLryqel
	 +/xrnP/SOarmA==
Date: Fri, 30 Oct 2026 10:36:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/8] dt-bindings: pinctrl: Add
 starfive,jhb100-adc1-pinctrl
Message-ID: <179337457099.76621.1364049270767988365.robh@kernel.org>
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
 <20261017052534.115203-4-changhuang.liang@starfivetech.com>
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
In-Reply-To: <20261017052534.115203-4-changhuang.liang@starfivetech.com>


On Fri, 16 Oct 2026 22:25:29 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC ADC-1(adc1) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-adc1-pinctrl.yaml | 168 ++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

