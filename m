Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18049F122;
	Wed,  7 Oct 2026 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384840; cv=none; b=uqf8eMZsKPgtcS4qe74QySsyPDHv4c9qERYFaMIWYuPF7h3RG8ajFuKeitG9vS7hjlfrQ9zi47+qX4r4vArODd457/tM42+v52S8eAljk8ztvL9k7f7U+J+PJuM1ow0FfE3JZHvPj9h28wCYftvV8a3Md6TiRFVLEZAMw88jF28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384840; c=relaxed/simple;
	bh=eI0i0ZcBg5YbWyNNVAfVNy0Y1+M2l5B7FRjudTL1gHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PtyZMpTIo3i5hrcFmUxGMlPSVmsHiH7Tfo5vM5tcH9GMpEMIbHpu0L4a72sQqD2ck/ifJtigyHlBdd3Qpfg7L87fRjhSptmm5CAG9yygnrHV5pQeF/Q6oWCu7c+4siePX3SNkPiBSN4qkNk/TASYifE+iBpFh8nmOqUweLWA3kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRmLCEJW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRmLCEJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404881F0089B;
	Wed,  7 Oct 2026 14:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384835;
	bh=73Rc7Xyk0TkvSBDIIvRfJgmkqJQeM9qYU791G4cfac0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GRmLCEJWGPpSBYJLSIU+dq9wowD0PK4K9IVCe2vkwWUzBnr92m8i+K9IYgX/EMb60
	 ykLvTt83o8zTFLfn4pY4Yx1xgQj76OQcBx425ZW24jW8Ar9RGwQNO/C7ZP2Kk1Sz76
	 p+wNmTflWgOvvY91FfkE+J1HHCR8Xd/ehgtzcqWlfS/cG9XccxH6LnkIa8Af1KAx4J
	 2K1MbDCOh2nywkQAUEcBTZ7GZO6KtIXIsDA7DErQDpYGDK3G3rZilFztlVSgquVOvX
	 lLQ0DfQoBKjAqHK8nXsRqH3MF8zAAGCkhqxIZ1LkPalKn2YgDtkFrWHfCQs/OHHNAG
	 aJQSOeMVlJm9A==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v3 0/4] firmware: arm_scmi: Some fixes to address conflicts with fw_devlink
Date: Wed,  7 Oct 2026 15:53:49 +0100
Message-ID: <179138477746.621195.11974347414199051085.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
References: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 05 Oct 2026 10:53:09 +0100, Sudeep Holla wrote:
> Peng’s [1] identified the problem of multiple SCMI devices sharing one
> protocol fwnode. His [2] shows the consequence: the first device owns
> the fwnode but does not bind, so fw_devlink can leave consumers deferred
> even when another device binds successfully.
> 
> This four-patch series reduces those cases within SCMI. It prevents
> protocol device creation in exclusive raw mode, stops treating core
> created standard devices as driver owned requests, and makes the i.MX
> pinctrl driver match the standard `pinctrl` device instead of creating
> a second device for the same fwnode. It also omits the `perf` device
> when the firmware node does not describe a performance domain provider,
> without changing `cpufreq` device creation. IIO/HWMON don't have any
> fw_devlink dependency and having two devices shouldn't be an issue.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/4] firmware: arm_scmi: Avoid protocol devices in exclusive raw mode
      https://git.kernel.org/sudeep.holla/c/3b0c8dd5a8d5
[2/4] firmware: arm_scmi: Skip requests for standard protocol devices
      https://git.kernel.org/sudeep.holla/c/00e304131509
[3/4] pinctrl: imx: Match the standard SCMI pinctrl device
      https://git.kernel.org/sudeep.holla/c/685e05f664d6
[4/4] firmware: arm_scmi: Skip unused performance-domain devices
      https://git.kernel.org/sudeep.holla/c/59d22f7a4dfe
-- 
Regards,
Sudeep

