Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613338;
	b=wj9AdN/r8Gp/nhHgMgvFy2tMoHgZCXLcC43RKrxL9+S/gNCaeyZKjW2A9lztrchoZlia
	 YkMCqrbeXKCv1hFWLPZK+fJK0IJqPT3ZKUdVj/Ih7l+C01++fqxHlNdKPQ2+alpVQxp20
	 QZ1pvvtVfTdQ/G875q650ma1Qx+teBwTRigpuRNYVfC4ZvYsUuvTjNHdBREq6Fms8EQq2
	 gHyAa2qqACajEQ67EkVUYEw15caHqOEB6eUkC2vPsypNfg4tIkJhI8wDqX/0HZeguymfk
	 5oFqr0jZF7Fyd/TuUvsRh0DnYNGkZodc2ME+WV4+0CrITFa/JSNWM0nwJ4tRu23MPJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613338;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8C477v01pd+NDfgdAe5Z6OV8+KxY2hNG+mGmWffRN/g=;
	b=yS8WlkgXrNoYopyZIqyzWk/CZKXtX/w6IOKr428LidXoWrgC0l0oB5ONImr3OpwOgYg7
	 zdc9HsnffCtvIv744r5MYIlp9UZkJ6bWbtQ+qy8nwv0xrOEAFSALxk9cfbaLL7ct302yf
	 YtkOUf4FBs8dsdZVBVbl/zp6ZG0zoxVaZuTOFzp3MSkQfZA2RfFCTj5Ze5mdGOfu/lJpN
	 sun558IW51JNhkbttpE9XN5NoeYUyltBqaY2EWU7Eaweju8enfy+J81QafIxCycyBNLKn
	 zPl36kleOf3IOQbEt/jLFcmzPE4xQPz+ZHUgte2sEZ7oBmVPRw5AMWniEoY+fcCisXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fzGvx/9M";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C41606A324;
	Mon,  2 Nov 2026 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fzGvx/9M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9FD1F000C1;
	Mon,  2 Nov 2026 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793613337;
	bh=8C477v01pd+NDfgdAe5Z6OV8+KxY2hNG+mGmWffRN/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fzGvx/9MvNwJzMZ8QnkNozMS3qJf3+018jCjHw4eEGRYQY8JxgrSZNhVoyg++Gr1V
	 RurHsin0AMFIzse1wEF2w/oL8jxEi9fsABe2ul/r8Le5F+neg+iKVWllHXifNWc27b
	 p9Fnfyh+5l2eMRX7k0ztz1MDaza6LwTulZeTiAhCi8haeTkMFJSZt+pMAt7GgiVRw3
	 VFMc+lPdrgB3ApNJKhl8uNYMpIFxZbmblvrIFhcibGV6nQzX10qEQMra20zHX9D8nt
	 QrufLD4l2lyvTu2Cbf9Q8bgD1RR2GInBKUXnxlmXFSUDv0YyvQjuFf6EtIO0tAotFO
	 a2eLKk7SOrD4Q==
Date: Mon, 2 Nov 2026 10:55:33 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.3
Message-ID: <dlqbjwxaitq5rbjprc2kjm4pbk4lgw2ygzy2k3vz77x3pklo7b@3s72tkvnzi4d>
References: <20261016085202.40187-1-bartosz.golaszewski@oss.qualcomm.com>
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
In-Reply-To: <20261016085202.40187-1-bartosz.golaszewski@oss.qualcomm.com>

On Fri, Oct 16, 2026 at 10:52:02AM +0200, Bartosz Golaszewski wrote:
> Linus,
> 
> Please pull one final fix for Qualcomm pinctrl drivers for this cycle.
> 
> Thanks,
> Bartosz
> 
> The following changes since commit 709ba1c547eaf37da36ded2ecf3ea4e304cdfa9a:
> 
>   pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12 (2026-10-06 10:05:09 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.3
> 
> for you to fetch changes up to 1df7f369075d7e8f7794981995a5103f1963bab7:
> 
>   pinctrl: qcom: kaanapali: add the I2C strong pull-up bit (2026-10-10 14:56:32 +0200)
> 
> ----------------------------------------------------------------
> Qualcomm pinctrl fixes for v7.3
> 
> - add the I2C strong pull-up bit in pinctrl-kaanapali
> 
> ----------------------------------------------------------------
> Joonhoe Kim (1):
>       pinctrl: qcom: kaanapali: add the I2C strong pull-up bit
> 
>  drivers/pinctrl/qcom/pinctrl-kaanapali.c | 1 +
>  1 file changed, 1 insertion(+)

Hi Linus!

Gentle ping, this still seems to not have been pulled into your branch.

Thanks,
Bartosz
