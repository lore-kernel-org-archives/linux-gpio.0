Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802086;
	b=Sg3dihFc9mGlsUyn4zVzcFdMAnW3YdGfJST0F4mbRFz8I7sqWBBdwhk4Lws4uP/7LsLR
	 OMx/ooZlnKB/d0iDeEt9Qk9s84l5LPLFGow1QHHazXq9skGCeEptsqSqva9h6+c2tTTEb
	 GQqNG3z6Qf9uehQm2DB+ctzO9RGKgIDhV0alvQIvCNnwR04GzybCi5KlyhsYzVmRLKgRs
	 tv1ck3shl0chFiJolVh3Dwes/X/wWBSbQWysMuMjsNrZom9Mbxnwb6cGIV5N4hhjLi2sd
	 tHH8oI/rYQCGkRRRny57a61bgGzcTlhmJ+KT5AO7Nt3r1lliG3D+SNZ6+L7iz1phJzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802086;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EWuc93Sijrp/hgRDRMe1IyjN/w0FK+tKD36/UFnsCso=;
	b=nnDpcrC8zyQApFTqVIdyXQUfI+sSHhCIj3qruG4eJVowj4+4koK6cYf6NPQoYEPpe9eI
	 Pemg4ISyhtSDfaiV9UO5uTIZzzJZMPkcLtXMXV5D1Qm6Dt0yui8+DQr5ccQNPCCJWEWKu
	 5rnzeUWZ9v2L0tPsRpFoQRDUSyZuxjPa/KBVy+mbMe4JhK8NHuDPrg4UCwWxPJ2JH4LRA
	 ecs/vOvTKGUOHIsablTBt6PtORLuqACRsPnrz8CTqlKRsvcJbjkDqPbUs8xQ1LVhmkmah
	 vwhJ5mIhNCRf8mj1L97RVY5McDOhgU6Nu9SViKuYj9+BcWJKndTLB/9FaqpQFsI4tMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPrTGat9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 85439606A31B;
	Wed,  4 Nov 2026 14:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPrTGat9
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5B2E61F00919;
	Wed,  4 Nov 2026 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793802086;
	bh=EWuc93Sijrp/hgRDRMe1IyjN/w0FK+tKD36/UFnsCso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SPrTGat90aMXfTCidZoIjMRJ+abYgt5OIsMRnPKFZFbXvNACruhNUw5cc/oYCQN9m
	 szIaSFVZssudeqvmaiFRUYOgMjKmYou8rlhr3IV8rG5VkUA6nrcfCZomiXpkPnPxnP
	 aglViOz8b1DFJW6KX8hQquSM3KtWB+VLBLSak6qXYjM+i22hUzzpDqwUkSFOGiffxf
	 h/0tsmyvFO3iIukk2TQv0d+cNN4NxlbK3Hm3bhGpcTwKjB/oDnGDy6AhG+j+JRH4ga
	 eETnmknnCnuTGTZ3tvZGkENvt/9PL5A1lpZDWcBm5jNl+HtfKgCadG5M9/FffPf9bE
	 742E9648rj12Q==
Date: Wed, 4 Nov 2026 15:21:22 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: linusw@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: kunit: test mixed-polarity multi-line hogs
Message-ID: <v4dpv4fmz4av5v5cnjfpdov6h3lgir3lowelveex35da2dj73b@l5rbtdkd2vg6>
References: <20261104120055.256-1-kimjinseob88@gmail.com>
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
In-Reply-To: <20261104120055.256-1-kimjinseob88@gmail.com>

On Wed, Nov 04, 2026 at 09:00:55PM +0900, Jinseob Kim wrote:
> A single software-node GPIO hog can describe several lines with different
> polarities. Add a case with alternating active-low and active-high lines
> to verify that lookup flags do not carry over between GPIO specifiers.
> Check both descriptor polarity and the raw output level for a logical
> output-high value.
> 
> Register the additional provider and hog nodes in the existing hog node
> group and add the case to gpio_swnode_hog_tests. Reuse the existing suite
> lifecycle and test-managed GPIO device reference cleanup.
> 
> Codex assisted with the regression test and commit message.

Don't put that in commit message, that can go under the '---' or in the
cover letter.

> 
> Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> ---
> Test split from the combined v1 patch, for v7.5:
> - Add the case to the existing gpio-swnode-hog suite and node group.
> - Drop the duplicate suite lifecycle and keep managed reference cleanup.
> - Adapt to gpio/for-next's provider label and existing test helpers.
> 

Maybe I didn't make myself clear enough: this should have been part of
the same series as the fix, just a separate commit in that series. No
worries, don't resend unless there's another reason, I'll keep track of
it.

> Target: brgl/linux gpio/for-next at d66b6b86d5a6278ca930112c634d03725beb7d9a.
> Dependency: apply the fix-only v2, "gpiolib: reset lookup flags for each
> hogged line", before this test. Without that prerequisite the new test
> is expected to fail. The test itself changes no GPIO implementation.
> The maintainer requested this test for v7.5, separately from the fix.
> 
> Testing on this target: actual UML/KUnit, before 10 pass / 1 fail;
> after 11 pass / 0 fail, with the same config and test source.
> GCC W=1 and Clang W=1/private Sparse C=2 builds completed.
> The mixed-polarity case also passes alone and within the hog suite.
> No physical GPIO or runtime OF hardware validation was performed.
> 
> Previous version: https://lore.kernel.org/linux-gpio/20261103224339.1180-1-kimjinseob88@gmail.com/
> Review: https://lore.kernel.org/linux-gpio/qboynvhfmvltsuopwotpf3sqdwho3qobxmw5qldooedjqodfgy@x4l6hscj5unx/

Ideally this should have been v2 of the series with its proper
Changelog.

Thanks,
Bartosz
