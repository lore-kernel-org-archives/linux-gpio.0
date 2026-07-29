Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609E71C3BF7;
	Wed, 29 Jul 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321113; cv=none; b=E5/Ym3gHAlTovIqO9SMFcXnwJ9jj/t5XujFzZ0+d9LPx+616tzMHMThbc1RBMCzghWUEyU4bTGjTXrEMrcmBsImV4tVV60aBPNVGHzHepIn0r19iJhLOTXlERrbZ3gWxl784ysRid77V4MlLY0mgXUyMHEzWh8AHlvbVTkyYZ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321113; c=relaxed/simple;
	bh=eDuXC28IyWYK6bwOs/hO6MgxUCIJutR/PbTMcmWV5qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5PkAclLlNtjhIjZ1jqWrGULH+DM9TB2iVb29A4xUno+BgzieiO2ZtFogVuXLxgaP9CLfLtqx21EQ/6pBsZ83DErbjmrZ7yj/esnBI/odrROkfiT6K00WtDvWIvJpjQ6UFQqkyzf+nW6kRZG+OtiQJGB1fkp3mekgV3rE8PxFE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpF2YZYd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpF2YZYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730A71F000E9;
	Wed, 29 Jul 2026 10:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321112;
	bh=WDcll2X4mfJ1x6C91gw/T6xgZXDCk4vzi+VVaCjZA6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VpF2YZYdhEHuZhuA2QCSr9P6niyM6E1ULRbDaMn9FdMXI19a0H+jMitMbzMAzCRJq
	 XyqkRdMVcScz8E+rw2moetKAqQ4pgoLgctNvXP0nLDTd78vJSnoTj4OisX75O5aFWe
	 8zlw83xz0wFMFIHyzHH16ZsQHUd9fSNabHkE8Ca/mwWWjp5yfLfMMO71fzmINb2Mwh
	 WdGvQcLhlbOzRA5Xae1NTCDyEZcEdftGqD7AebZXXWzix//vqo19RE4PX6vYYBKa4q
	 ji5BmdczgRpBPe6AXJLtqqxs5GJG0lRl+zy74TESVcE3GU8kQ7MehVj2dJkshjBfOd
	 T1aGqQhZWRn4g==
Date: Wed, 29 Jul 2026 10:31:48 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: spacemit: validate pins in pinconf callbacks
Message-ID: <20260729103148-GKI76518@kernel.org>
References: <20260729-spacemit-pinconf-validation-fixes-v1-1-edeaff398fb3@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729-spacemit-pinconf-validation-fixes-v1-1-edeaff398fb3@linux.spacemit.com>

Hi Troy,

On 02:26 Wed 29 Jul     , Troy Mitchell wrote:
> Pin 0 is a valid pin ID, but spacemit_pinconf_get() rejects it by
> testing the numeric ID rather than the result of the descriptor lookup.
> It also fails to reject nonzero IDs absent from the SoC pin table before
> computing their register addresses. Check the descriptor and use its pin
> ID for the register lookup.
> 
> spacemit_pinconf_group_set() validates only the first group member when
> generating the configuration. If a later member is invalid,
> spacemit_pin_set_config() returns -EINVAL, but the callback ignores it
> and reports success after partially updating the group.
> 
> Validate every group member before writing any registers so malformed
> groups fail without being partially applied.
> 
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
The fix looks good to me, thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
