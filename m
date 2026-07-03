Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC11A2D1F40;
	Fri,  3 Jul 2026 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783094125; cv=none; b=qXPQcjVq1lU19Vp8FKEwNwpJiRE8FUvKIx3apJvZv0vV3Umauz80o/Tr+2ZX09ZkEKHTwA5UXKvXp1tibDQjt1MhrBMBZeZkVKL9dlN3QcBHKQBq34kPSv/vM+HpgTEDVFhnjCyYXtiZbZ6JbmYAehQGfeOberWrU9UA75Ys3M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783094125; c=relaxed/simple;
	bh=DzQG5y6S4p0WsZ4UNrRoZ4+yqbC0hPz0GthLB16ji+Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Xlxt7eA2289WQdsOriM71l6IdFXwyJa4zndtpJZdNNVFA6Of9n4rCsdxcuLToLZFtqfKG4GAzYJ8qtaJNn7KssSVUoVFj3mQPrT8oA7LievCMHUcwUHg5DjaH3Q1pTA+fd3CiaVKMvqmXwN8mAOo0bWWN4St21Nh09ulr4H54NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RV4D5nCc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RV4D5nCc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AFC1F000E9;
	Fri,  3 Jul 2026 15:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783094118;
	bh=xI/t66ac+ic4oGwPzYoMNIgelFa+hMQiYFJOqrZl6uI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RV4D5nCcJaJjyhYOKifAVo4xjiJrGMzUTFBKiW4nWXz1I15UWk/7raT9s3jKnMauH
	 n+RrDFIa7ZRUXBmkZxm2+TVcJAkuuP56uwiZAfDy0SaYsibSmgBNKQE/a8JG+uIDnv
	 zHEV0ntjpMnaOPAhKWKYA7IxmRsyWLG09mjnTiDavdzjSxSYqGWrnTYiW2U6mwd5fe
	 wbClL9PBUu5nHK8y7yzJ5D0+mbWIg6MXrakwE2mEyLR3eQSTFfBpKop2YWHNHg1+I5
	 2XanbfRkUJDUVwxpLadrcJxRsgmGXf74YFwSkDFZQr8BiVocWhvZilAt2fzO+XUgIU
	 z1lrIAq2Xd4ZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56C4C3939347;
	Fri,  3 Jul 2026 15:55:02 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.2-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260703075903.5102-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260703075903.5102-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260703075903.5102-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc2
X-PR-Tracked-Commit-Id: 9777530157e7b82fd994327ff878c4245dadc931
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2916bfc6baf7e1215b00169d285b88321299b629
Message-Id: <178309410089.2776291.18230823079101094422.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jul 2026 15:55:00 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  3 Jul 2026 09:59:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2916bfc6baf7e1215b00169d285b88321299b629

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
