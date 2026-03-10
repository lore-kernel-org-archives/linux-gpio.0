Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7DE3A16B0;
	Tue, 10 Mar 2026 13:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147980; cv=none; b=Q3g6+O+7Cucxt9j5TQQYfpcA28Cyuoue5jSOXl8Wu71+PAKY8r50XFAAnhCjz+U4HRblSd/ukz30qUEP5x01ovuxTn9UuEa5W9u889BqcX7OubmCJGMyV1KSVMXBu3lZm1XuQpYkbso4xJGl+33B6Lb5zYXlnDN21WjXP8HmKm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147980; c=relaxed/simple;
	bh=NCYv3ScJeZIYKDGxml+7ADHwSUlm9Yy8y11GpVGfHFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VU13pkvgiMdUnwYfxPOKfy4WHAjDIpja70uRjICvkWZ0O4zl7bf+HYWX6Ypio37N1zXLIn6QHf9PjNTGKCPH0EJ9f0vauS9uQoRx9MfupWlyK+fbreyNmi4qoOqgXODMp57IAWJpHvB2cW70l49LSPG5x7fvN6nlgMcxWJVYGaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5c3Pn7+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5c3Pn7+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C362C19423;
	Tue, 10 Mar 2026 13:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773147979;
	bh=NCYv3ScJeZIYKDGxml+7ADHwSUlm9Yy8y11GpVGfHFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d5c3Pn7+UTTTF4bW+a2+KDmhfMGoH3jJqEbF6gSEYw+eTQjXZnOumVLcbyiGS8i5c
	 guOTM1rhQQeBDNJjmnhfeG/2wUOlAtUZXNqnN8un4q1ZksaKhf/1hoWKlbsM/d8cRm
	 sI7EnD6/5R+kK5EwiRL6meJxVAhF7hLRIPJgeydiLrqHVOHEso3MlDD7M8FJAjKBGI
	 0xgRUzsiDPbAjMy027WhaUP/jQvdVrtvMHZwkJqPnNZ0AeI7iDQ43LWjRygFUufcXU
	 GMrmotuFgcrL3l92nlynbs4ezDYBSkPsf1X/OPY5jN8Brp62afYXBdYlyOoUFE/k7T
	 WoSRhKdSFPlzA==
Message-ID: <13f615e9-f543-4630-8dc9-dd9c954ea921@kernel.org>
Date: Tue, 10 Mar 2026 14:06:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: ipu-bridge: Add ov5675 sensor
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, dan.scally@ideasonboard.com,
 ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org,
 hao.yao@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com,
 miguel.vadillo@intel.com, kees@kernel.org, ribalda@chromium.org
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-3-antti.laakso@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260310124427.693625-3-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Mar-26 13:44, Antti Laakso wrote:
> The Omnivision ov5675 is found from MSI prestige
> 14 AI EVO laptop, for example.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index c895584e25a0..ee070d44d5f1 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -91,6 +91,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>  	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
>  	/* Omnivision OV2680 */
>  	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
> +	/* Omnivision OV5675 */
> +	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
>  	/* Omnivision OV8856 */
>  	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
>  	/* Sony IMX471 */

