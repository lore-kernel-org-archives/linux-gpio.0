Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC843A380B;
	Mon, 20 Apr 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691280; cv=none; b=PSkAotweBlaMMO4aK/XX402PLTftO4XZ4NykFbmJbQY/T9uwa1NQ5+Qe5tI7S1c6wfkCQ5VMUjRrU2qg2UwrLYtObOObEoirdvjdu+dkj3nucWvBAjgnQKQ18r1A1lylJlh/PEs3rFtF9UUwR4eTb+FrNEs+GvP/ZRw49XbDV7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691280; c=relaxed/simple;
	bh=v4DzARJcNPISs2RhdGEomhKZb1KwaG2QvZSKdA9rwfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cE+xV3e4Rtid+ryUg7RQtrWBHncsgvOJwrITA78iG8T6YNmQyXWB886LOjxDxUa2u1uY6A5+lb++F53SzLGawTyAX30q9//6ukZgenR7aa2fWCK+ntPZc43qigpJMPw8kFAprSUA3OM+hIUcUY3YY3gkBqSFBej1Dqdv4Io6cbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSwhbzxc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSwhbzxc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7929BC19425;
	Mon, 20 Apr 2026 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691280;
	bh=v4DzARJcNPISs2RhdGEomhKZb1KwaG2QvZSKdA9rwfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YSwhbzxccPz9I93G8ii+fCsgbE2RqrG94rQoYiD1GQ5Ux8CDrYVxEStuGQ392Or6X
	 RSUNrYjjmVuztCHINXe27/d/e6c19E/sMvdV5PHqeNgsEaUdhegCVvO/RzCWPjehSK
	 BpvhjcqHLgAB8aLFFENyzJnuCupcbYdXJOwG6j6dMfviLKgz7YcQzSMhZ0f5NKe+4A
	 x+IBNdJj55V3UE8N8rfq404BfIBUhwZJF4nWvaetsOEgFeiGpbv3oFF6se7pcN1/KV
	 X8LcmwCWz33WTWuuftGN4JzCwBveVDwAoLbKuMCXYwVqm1IsToX5Jt8nSUJNzUJu4U
	 7GStbJ3uRWJ2g==
From: Sasha Levin <sashal@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Sasha Levin <sashal@kernel.org>,
	stable@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 6.12.y 0/2] gpiolib: backport fa17f749ee5b and a7ac22d53d09
Date: Mon, 20 Apr 2026 09:21:00 -0400
Message-ID: <20260420-stable-reply-gpiolib-6-12@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415-6-12-gpiolib-cve-2026-22986-v1-0-3a7a6de332eb@cherry.de>
References: <20260415-6-12-gpiolib-cve-2026-22986-v1-0-3a7a6de332eb@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Apr 15, 2026, Quentin Schulz wrote:
> This series backports fa17f749ee5b ("gpiolib: unify two loops
> initializing GPIO descriptors") and a7ac22d53d09 ("gpiolib: fix race
> condition for gdev->srcu") to 6.12.y to address CVE-2026-22986.

Queued for 6.12, thanks.

--
Thanks,
Sasha
