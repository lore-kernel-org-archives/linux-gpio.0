Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303417;
	b=saoe+qVFzI4qJoBzHf2yk7+/QG0jCc/561ifTup91GPXqKELhFXL8N+9JWqHVNnRRA/s
	 2cLcYYFfZasXVmL2IchaAP6BCKS7lOUBd+TtadU8k3dUN0Up+Ce4QN2mUPyamBaSAsy7C
	 sWYlyBymjI3dWBkWM4mrGQnj83CmjlxtUH0Q4+RBGBGz2ld9ARb+7SNOvAU/uFNJN7Vlv
	 b4QFdCuo4RnH677aROHH2BLHBmiCs+8ONW64oSKuN8DlOynIjopuqzUErlpbkPtPYafLX
	 md1G1ANlCzrXu9mz9YKSZ6+RYISOv4sOhvdM7lBylEQ/JV1Q2dCQx5JdvrR+QQDNDYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303417;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VFN2eORabqEpIcfelveA39JDJ/gpkP0rYqEROQukJ/c=;
	b=u1pqiHHEpuKK8Q62gEpAEy61QS7fD1u7vwb6lGcpJnxYRXqBF/PEZvMvY/zon1HF3dp8
	 1D9lHIDw0idAgoqqCqA2fbNxSjJiqj58B/eXzsf92qMLth/ffvBvWMkBbs0VCRgP+GkZE
	 wtdiESq/j7b2I7LPmoQW1WUTJyGuPgRGAuGv3peyJH9uPHXtSbgdLUK3dwDrOZYzHQDRa
	 BHOs03cgdMR1emTqC+xfxWJEVMG8q7jrHdBhQwnGI3Y8u+HSNtD+9g9KSJweIIuOpeRdy
	 jJeUPq4zTORi+JSGjAcWEisVd8vQyECkBjcNu60OroROJeS6IJBe7UzYOhVey0LSZzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8X0DpVb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 7A456606A331;
	Tue, 10 Nov 2026 09:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8X0DpVb
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 30D6E1F0089F;
	Tue, 10 Nov 2026 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794303417;
	bh=VFN2eORabqEpIcfelveA39JDJ/gpkP0rYqEROQukJ/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d8X0DpVbdRkgGqUV3GdSCZA/W6g7zVY7Wl79Ib0rwDXXZBvlhJIGga6G0KlfPKsRS
	 mICFjR0S2+gl+4Sdk+cVT5zNWfN/WwBg3PFFlEtgz02ZOqa7uWumgKCqZtRiQt0GxM
	 6ihtqwpNrm9N5DYFoSz+480X/Na4sQ7v2vWJ6ge5loqw2L05+q6PBvXo3sr3fCgP55
	 TFjvhLdcHnlUzXBjKG2QVnUwy4KcDaZjaymeSIphKyksKSSPTtSfFc+Sktd4lE2awU
	 vPz0HZC99bMSv/1Ihri9UzKp2RTFZHcOrjCTi42pUUPKHOpw6lYVz7OpByn8EFnH5+
	 kr+UDEB0MeFFw==
Date: Tue, 10 Nov 2026 10:36:53 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Message-ID: <4vtm4ddszj6creecbcfn7i4rsf2sdknd46k2hic4r636q3f5if@6tlrrekaluvj>
References: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com>
 <20261109-halliday-tlmm-v1-2-a181d54214cd@gmail.com>
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
In-Reply-To: <20261109-halliday-tlmm-v1-2-a181d54214cd@gmail.com>

On Mon, Nov 09, 2026 at 12:28:38AM +0000, Stanislav Aleksandrov wrote:
> Add the pinctrl driver for the TLMM block found in the Qualcomm Halliday
> SoC: 224 GPIOs with their functions and PDC wakeup interrupts, the UFS
> reset pin and the SDC2 pins.
> 
> The tables are based on Qualcomm's downstream pinctrl-anorak driver.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

FYI The driver looks good to me, with dt-bindings reviewed, I'll queue
it for v7.5.

Bart
