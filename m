Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E7B346E45;
	Wed, 18 Feb 2026 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771439946; cv=none; b=ngDyYFgabts7pPWxLshT/OUmWa8oeZ5bcFJVGDEi3eQAP+l8Us8bFDCQVE8tDrDWUZBSAQpos3YCknZ5iQj89rPHRYTuo1TF3U8I2S+pIKYdj0RYe5O6PbfTsIYLcrLwW4KB3hfEozSZPbhSae9+fu7TQ2/1QfqJbqEFMiFMByY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771439946; c=relaxed/simple;
	bh=MU38ojQtO5E1uk6qyEB+YcDaosdVNcaLAaFz0GYcRdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfepfOEKbY9v22cGnyIGCz7Im5lYzsHn/ivaoEdmZXNp1o2ZS/QGYaku9dGVhuAKMpu4HeUDsRNXBRJ+Q/K4braY2tWq1K88xWrSm/uVVyOQh1l/tFEQj9P4PsA55lhQSMw/wHB8ujMUqpBFzUy1X0/0P3ff5opiN50L/xnbWXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9P4A5Z7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9P4A5Z7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA1FC116D0;
	Wed, 18 Feb 2026 18:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771439945;
	bh=MU38ojQtO5E1uk6qyEB+YcDaosdVNcaLAaFz0GYcRdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9P4A5Z7UsNKxy2bGtUdJv8kjCwMCMQXCyCFpNgjeEcaH1MF2VZmFL4z/pUSDv0QV
	 8pD2EmpA83r7rRDYgUHYLZTs1bs22Yyf3WxDT6YqMwEkNnfW0OIsapycYKk0cAWJ5i
	 qXgsUIG1Vh0r4IVhLd0jOv38RWFCrTspgLmLVsPYynKl1ds8KpYILcdiPafSDDQqPc
	 qhpnV1JDUNRl7xlf0m236fzMPEJKfCwFaVXi8s2qNbr4+1gLo1l7/Iu7UGnXK0La/d
	 MPPSK0okTzUTX6sDpPLMvh/SfXRocmuGqzopPR/pmWM/x5nJYCZNca7bbkjn8bw8Fg
	 fwqkwfdWhdvaQ==
Date: Wed, 18 Feb 2026 12:39:03 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: convert fsl,imx27-pinctrl.txt
 to YAML
Message-ID: <20260218183903.GA472024-robh@kernel.org>
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
 <20260211-imx2_iomux_warning-v1-1-1c5233771b32@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-imx2_iomux_warning-v1-1-1c5233771b32@nxp.com>

On Wed, Feb 11, 2026 at 04:00:00PM -0500, Frank Li wrote:
> Convert fsl,imx27-pinctrl.txt to YAML format.
> 
> Additional changes:
> - Add the compatible string "fsl,imx1-iomuxc".
> - Add gpio@... child nodes.
> - Add ranges property.
> - Remove the redundant intermediate node between pinmux and group nodes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/pinctrl/fsl,imx27-iomuxc.yaml         | 126 +++++++++++++++++++++
>  .../bindings/pinctrl/fsl,imx27-pinctrl.txt         | 121 --------------------
>  2 files changed, 126 insertions(+), 121 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
