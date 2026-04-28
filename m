Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6CA3939BC
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364012; cv=none; b=peBnT7f8jO39JcXFkRB1IvIrz5+xPL/7WxTGjoGkGF+4KEJ+7/yoqqfiM/GkGMvVofYZ7HcF5oCTL9TG+Fkh6awvykQNS7E3wJXSSxU1kBv1xrTzwNwJoVOYg9uFYRG40YbffFjJ2UrfEQpKdkdB3GTC2uWWaX5afQErqQkqXnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364012; c=relaxed/simple;
	bh=wJzQNJKqxdW7cAQSIeWEHDZcC1xdI/PLPqwoSelIo+w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5hstdxPDFXZ7Cm8jHd8ODNXlGdi/JIRVy3GNJnz4bMZ2P7aLwyPV9ZWosrXCF47Z05uNMy89arX3HtB2G09rHWNmYH9Ndv3eibFUkxeJE3jHszgsSL9yxqCjXWl/28219NMNLIOsjY8VmGS5wbhB5oNOQ10uo/wxowfnBiWhaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2Gra5Cm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2Gra5Cm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081B6C2BCB7
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777364012;
	bh=wJzQNJKqxdW7cAQSIeWEHDZcC1xdI/PLPqwoSelIo+w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=O2Gra5Cm1mNX40I1JlbUZSNwOUjjiK/sBy7hABBmDGhUkkeAT+jSGZ2apeJZIJXVT
	 3ZUDfmR8Y+5BdCGrEEiE6TkpmGV/7BrUSaSVDcjX5XxF3xUnePwcvLzs+szAGHiroI
	 A24UADmm3aoC4EC5yjcFX2veTNtAKKipBaeco84THq47f9Mb7CMuzHtXvz+y3CvoSI
	 6YVsbHTGd5n7eTxYb4bf20reCC7kC6BncnPBZCJBW5NFeEzVps2Lot1tbkhOZGFhO8
	 cU7l8Psd6bqKcGzexPGO7CBdSraaavxYAYJryJEt98Rh4Hkt7YvQ1avQjnXKHu+gwd
	 aGjeNXn10BF4g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a41099fa86so9762471e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 01:13:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YxVxWJfoOoU/2i5LDaGxQxKlSezjKPv7fYnyWFQ/+8g161rf312
	AfF3wcvdeTQX5bQV7yPzvHCGuZ2WxYdLY39dwesz/K9VOOlsKGCFfaCT/PkN1Kis2tebzh4kMwX
	hN0vdPdlwzo+k6KldWY1cN9neUbW9rAkCbpKb7GgAVg==
X-Received: by 2002:a05:6512:3c97:b0:5a4:1133:c305 with SMTP id
 2adb3069b0e04-5a7466237f5mr949663e87.26.1777364010554; Tue, 28 Apr 2026
 01:13:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:13:28 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:13:28 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427214126.17818-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427214126.17818-1-m32285159@gmail.com>
Date: Tue, 28 Apr 2026 01:13:28 -0700
X-Gmail-Original-Message-ID: <CAMRc=McB87bQUBkDoPJaSvh+dx71=bb8sOR9uWSBKyE61cSeaw@mail.gmail.com>
X-Gm-Features: AVHnY4LSpxU64a6sK6dHUXORPEFDDbkdKVajoYmtHJjoA_EomPU6gA-9IuhMf-U
Message-ID: <CAMRc=McB87bQUBkDoPJaSvh+dx71=bb8sOR9uWSBKyE61cSeaw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sim: Replace sprintf() with sysfs_emit()
To: Maxwell Doose <m32285159@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linusw@kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 23:41:26 +0200, Maxwell Doose <m32285159@gmail.com> said:
> Replace sprintf() function calls with sysfs_emit() in the configfs show
> callbacks. This will help harden the driver and will bring the driver
> up-to-date with more modern functions.
>
> Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---

Sashiko is telling me you missed one:

    https://sashiko.dev/#/patchset/20260427214126.17818-1-m32285159%40gmail.com

Bart
