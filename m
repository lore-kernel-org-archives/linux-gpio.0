Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478566;
	b=0Lk0Z/VD9G20Q6jmqHDQ+B6gZwmgl6TjBOOLLj8Wf72gtRDMyDT7KAboCruAOyF1gY+C
	 w/a7d/C2xbu6ZpX7eS0kHlwHiqVLB/u7zat+d/LVckkO0iM6ZykAGkSUfqD5gZ3i9Y7hf
	 1YB8Flsl7cvVyxUIFoDJjx7/C3y6TIuxI7aIRIQ6gb5Z4W+gx4DnoqH9UxCtEekohIcD5
	 Ph9w8xi3QzHOVmJtWGTOataZoAZZl2rluYnxH5A6MCi1DAPSyqP2E1phvQsw7oBqh9Url
	 +aYAhYLPANgn7eLUDDybG1Psfe0ckKJsAS3Y4IJI/8D/Cc5rXNxiky+OrIOvvascmrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478566;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bMWYtJ7yNJiovqtoc9KZe8RAhkrFtmJr2vnr2XcuKP4=;
	b=fYSHNAs6/6IFKtmAjbmiC4AaFaArLCA0wN2/Wahkr4XFtyLt8JED06RJdQUPRcv+Mp3I
	 7/IuYkbP6ieQBi/zxBpNQkkXramOS+8sswj9h+ziecxgltBgkhPCQSXyIzCfl53FwHh0i
	 mentK5CYLXyho30QhvE43rlyixO7b21Q/hxqKmWXv+FtwuF7zdo8x4Krekdz8ZX2qNkVl
	 S1mRbAQTu5tFZZqMleMPj3yUcrYgMYT6YFHWLJA53q2/MBbHcmgkEHmbu5L4dlEnmM0zF
	 74eAWidA0IK3YSBZhJVUv00PmOhHIJB/arioUyv4zf4SCAedjfOolVhbLTQ57m9bX3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5TczdB3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 6E8CA606A883;
	Thu, 12 Nov 2026 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5TczdB3
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 216041F00A07;
	Thu, 12 Nov 2026 10:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794478566;
	bh=bMWYtJ7yNJiovqtoc9KZe8RAhkrFtmJr2vnr2XcuKP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P5TczdB3UpdMAmSnybKC+nT7W7q9jBJDy+aJydbKlOcvz/9M8tyzQaGEuZI3o1arN
	 ezHAy2ny2OoyMLgLhc5Ly/bjeI45Tr+nNz6I9A/P2LtuR4iu3b85x3a16PCPOMGtLU
	 1OxcLj3m/jCyyBdaf3O/k1KNpuMo38P8lm4hIrxo927+9nRY8JEd/RAFuC6NaKhTAK
	 5D+jxypA3tvfHDT4D9LQKxUf7gzPzO7eg4d/+irID8yRoMpC6CsiO/RCVQRmSlrAYt
	 yYo6QDo9LI6d91iFlJq/AKIC6tobx0mPfrXPhw3PD//02MBaV+LAS0rEbPBfN3ndwV
	 kQ2Rm6+0iaC5g==
Date: Thu, 12 Nov 2026 11:16:02 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: amd: Steer GPIO interrupt to low
 power/efficiency cores
Message-ID: <vw7a54jrw42x2m22rhbwcdx2e7dwa6m4chdny5pok262nlnwje@ssyr5dhhnb4z>
References: <20261111-superm1-pinctrl-power-improvement-v2-1-3b294116c835@amd.com>
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
In-Reply-To: <20261111-superm1-pinctrl-power-improvement-v2-1-3b294116c835@amd.com>

On Wed, Nov 11, 2026 at 08:42:59PM -0600, Mario Limonciello wrote:
> On hybrid x86 systems the GPIO controller interrupt can be a frequent
> wake and handler source.  Servicing it on a performance core can wake that
> core unnecessarily.
> 
> Prefer routing it to low power cores, then to efficiency (dense) cores,
> using the CPU type from the x86 topology information.  If the system has
> neither core type (non-hybrid), leave the affinity untouched.
> 
> The placement is applied with irq_set_affinity(), so userspace is still
> free to override it.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
