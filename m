Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1290C368D60;
	Fri, 31 Jul 2026 03:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468295; cv=none; b=iLAMsTCt0Bg1kppRkN98niyat4vDF54XxkbkftZvdeyBQB/gzTRDsXzpuCiUge+x/VSapgCaVQ6u5rmoSLnFwSCRtySxl2v8iEKubJ3WJdyF03TDuqCCb4UAt08+jDXd0DMN5grEkKWtZiZ7474sFmZUaX19LbylNBNpnNXcgg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468295; c=relaxed/simple;
	bh=7v6GVqpJbPKQ7JOOfAP0ukd1xg6ILAymL9J0s1Usjjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uk7p8hK6934tkJyBUBe8JrwKzpKZy/rE6HuwuBMDqXjWBQC6kfbhxf/HnaICkBGMJQhLhoa6mWMB1jN/oeSoftwsjVyD0OVQz78SRE8aOV3ohMc4e91Eacw5dJSHIYwPBV9o7Tbk2PEBk5hFehnSxaN2O7nYsU2J97bL4GqnrZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G03VM0nn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G03VM0nn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93681F00A3A;
	Fri, 31 Jul 2026 03:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468293;
	bh=BT+CR6d6U090D4Ju0JWxx0jSMnPsMMvfJWcg6xiaBdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G03VM0nnJE6iratp5G3HUvQ29FuABM6fMrLYT9rfh4tdx+Od5GDgPFgheRjorluHp
	 qGOFsAlwmVKuTZ+Pb+DtZSrLMz5TZ7SeBWdjOZjJmnWwfPKe5AGiEx1qG19wDAg0UW
	 5DJ0qqc5laRfeS0Ug9zjLOJPtZ43U7uK60Er340l18AXzBS83Z2YUQWSjGqgbLh5n9
	 qTheqmSi9LAgMuqhluguqJ8BG8OxTQ1POjRDXjFn+Fgv1CrYDGNC4ZXoFIp6uDvvgW
	 aIyW1J3HGQDuGdOkHjcH1VJ4k9I27CYfuD2ilsI+RufAe7uw1kmpDA24nKcF96uzFj
	 X2lHz3kJzfqQQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v5] arm64: dts: qcom: x1e80100: Add deepest idle state
Date: Thu, 30 Jul 2026 22:24:26 -0500
Message-ID: <178546826823.316815.12925758859888306838.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715-hamoa_pdc_v3-v5-1-00440cfaf711@oss.qualcomm.com>
References: <20260715-hamoa_pdc_v3-v5-1-00440cfaf711@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Jul 2026 18:31:30 +0530, Maulik Shah wrote:
> CPU subsystem deepest idle state can lead SoC to low power mode like CxPC
> (chip rail power collapse). SoC deepest low power mode requires the PDC
> interrupt controller to wake up the SoC as the GIC interrupt controller
> is on Cx (chip rail) and will not be functional to wake up the CPU.
> 
> PDC monitors both direct SPI interrupts and GPIOs used as interrupts
> in SoC low power mode. Further all wake up capable interrupts gets routed
> via PDC to GIC when SoC is out of low power mode.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Add deepest idle state
      commit: 95f827ceb21e2885f40eec5d93a340abbcc22d13

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
