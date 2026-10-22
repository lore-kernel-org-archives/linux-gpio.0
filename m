Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693906;
	b=VtaR7tenWPeYiTGCphsddWBzjrYLwc0/+bTsUUUwO/6AgKwJsHtvsyGywNeGOeaW8ES2
	 t7KaXdHcqgiLWWRhNBdFheXT6zJCw1sEMKYrct1tVv5ZlvxKkETaXJjZ5YsHeQl8hGg7O
	 m9G1wBzO7aztoUhBBReQvwCDCNr73zWyYpc/9kjLaQrru1S7gW9ER88gMo6eqeeWWMMQK
	 oP+f2Y92fhZI3dWcZWxLZxW3w6787dhH0Klj5YC8+YJYnvWD2526H2M4URtVd/98th9fT
	 k7l6O8TEhspEaEwT5HDhNaYC7LgO0aPihvI/jpwvDEv99Grs1JWMeI/xq0RVgLQ/FYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693906;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=XQ8JoZXDXxMwNIkvsUqOg8HUAu1YKndjInw1nWyYK1g=;
	b=JCbYmnydYp5jNtz5UER4Nl7POUVFgPooxFe5zWB8LUguwIMDkRmDSyQy43/CCtrkbHDI
	 TJWa3LDM92v5OZq84bui0JWXAe2fOKcy0cDYW16KnstugDhSRFIaTa4eVFDb5BNMrj83m
	 VUFQCwIfKdxXpiE5k2A/wG3f5fpea28pKdGZUGhGnhegz2c11pkhgWKTc49/4TknKL65O
	 mzDhMDeIB321pQZIbZ/HjEHY80OXbnvPeAJmyE7q+oNWUkzdThS31SvBEY2FtlSzyAkep
	 QSDEwgD9ncz/4G6OcdiVPvszz4PB45lrwzlpKgxzrICKN0iff0xGQm3z7CmNafqHmBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VPYs7bLU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE9C60A380E;
	Thu, 22 Oct 2026 18:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VPYs7bLU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C521F01829;
	Thu, 22 Oct 2026 18:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693905;
	bh=XQ8JoZXDXxMwNIkvsUqOg8HUAu1YKndjInw1nWyYK1g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=VPYs7bLUo2miBUZCjgNAtneBkn5dcr4p1jQPkEk2WC7xnbKV08aOeiUbxMwIY93Ld
	 NR2rlS3MJbxiG+RL7GfCCZy/ykUDFjB8TSrojcQJcfGsX+/U55zoVywSndnbOUrQdI
	 0tOhAuzvHpw9/uDNBOLVBQwITLu+i7MLtt0fs13WeBU3PZm8VOAOB+VGpVU/ZowHGq
	 QfYmGZwb/3c7l4itUO/XZ6CLJiGiHe5Vz1Z+wIRW00lCfmnKCkp9V4Bm3HLRLVrjRv
	 7tWM1sl+C/4Dvts69WQk7z/Nbi7APzgt7DUCFC1LWzfTPTOrA1YKbKH1rAi1INPSNr
	 lHhTMzw5JA5YA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE47C380822E;
	Thu, 22 Oct 2026 18:31:45 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019093001.11999-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20261019093001.11999-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261019093001.11999-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.4-rc1
X-PR-Tracked-Commit-Id: 47f16cf7a6017212230985f6bc7f1b55b6d234d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bfa231bb4c7eae56b9967da19d1678bf0847259d
Message-Id: <179269390451.87271.15447839303990253198.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:44 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 11:30:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bfa231bb4c7eae56b9967da19d1678bf0847259d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
