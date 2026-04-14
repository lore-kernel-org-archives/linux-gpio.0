Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE54324B2C;
	Tue, 14 Apr 2026 06:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149164; cv=none; b=P3BhIX/8Ch6z7JtK/waBHzTiHve73G8xi3gRzhuF16fr8MsgNfAmcsPDh8KQocM7CdDhXBu2mxt1XkfHL2yDPHQfO5UCoIfAAqpIsMdepwafikFDG9t3AdvDTRVurfxRCUFrxUKAYQHVTUDs9bcFVaKpY1n2BEpyeibrLpqFn6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149164; c=relaxed/simple;
	bh=K4oybcycMxSVWlM7LCJXfJ24fNZzAEJthizWSnJFlmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJ9MnzJAuXoDAZrJZlLzzMOH8foVREgaN/5n9hU7P1e90XFg776ic7cGVw3TJISStF+AsquajuWjzF9Z9HVTEp6rR8rdQ0bsmaIaJjXu+hrK2Lc8/QCSG9gEHNVr9BTQdy2S3di9t5Ls++E2oHCWFfeXrCl7nyo5mTV956DU4ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8Pim6ma; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8Pim6ma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D567C19425;
	Tue, 14 Apr 2026 06:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776149164;
	bh=K4oybcycMxSVWlM7LCJXfJ24fNZzAEJthizWSnJFlmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8Pim6maYQyrcTqM4pWnIiwlti0JxyvKwvwuUlrZSRQVF1WxedvuTiC3i9iC9LAA7
	 BRFuRUrlRvkDbXLoopVCe6vAZTp1q/I1QH39ANsGtF5BrpHch+ZmE3Ny01PXO1LUnU
	 WXnvs+YrTi4KAM3IkqgyyCMgO8cG5Jwh89ScSDjW3HhuHuSRxSu40AxnjHeCnfnED0
	 OWZaczglyJTHNZ9XuLTN/UZ857569LXCd3rHH30JyJIIQTkRhWw8wWjyFh54YXvWwW
	 +8YXo5J25iqrV3fo27NHeb9/ZgxfwI/D2P0QsHb/hEDd/yRaUoxDI1P/8JZZtSrvDR
	 HJaOsuuef8VAQ==
Date: Tue, 14 Apr 2026 08:46:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
	Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
	Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 05/21] dt-bindings: dipslay/panel: describe panels
 using Focaltech OTA7290B
Message-ID: <20260414-silver-chipmunk-of-storm-c6572e@quoll>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
 <20260413-waveshare-dsi-touch-v3-5-3aeb53022c32@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413-waveshare-dsi-touch-v3-5-3aeb53022c32@oss.qualcomm.com>

On Mon, Apr 13, 2026 at 05:05:28PM +0300, Dmitry Baryshkov wrote:
> Add schema for the panels using Focaltech OTA7290B controller. For now
> there is only one such panel, from the Waveshare 8.8 DSI TOUCH-A kit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/panel/focaltech,ota7290b.yaml | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

