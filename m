Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D2447AF67;
	Tue, 12 May 2026 08:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573544; cv=none; b=rjrMo2YDUPBXfz0s453EzPxDDhB59HeYUkKLObNTPdxFo4zIxW6S/CNLhSypbI+lypB26sKVyFP3EZU0mtVh1lOvDe2WmjDDNGbM0mvjvqiQf6WP5dSNTbfDc0nx2VMth5euKhjBwqUq/nJFrYmtBvIjvE2rbBvsbz7hxKc4QrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573544; c=relaxed/simple;
	bh=gxCr/1UNWPZ326QfVEbZQ7yQBDhctXElIY6zwZWY4tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhTYtwEzq2Bdd3Inl4PbmPoglvwEuYXtzsUR76rbmZtOQhkA/WxsoI+0yPFULbXSRWhObZ4aaIfdc5yDhHEtC/hSpxRcfJKO8bLQoaV3VYAzIvi7RWGF9JfcKkhbEkAK1b1KyluX6HZwE7ttWnJNdzM+Iw4r6gw5OMbaSWUblMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgiYAYDK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgiYAYDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28FFC2BCB0;
	Tue, 12 May 2026 08:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778573543;
	bh=gxCr/1UNWPZ326QfVEbZQ7yQBDhctXElIY6zwZWY4tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgiYAYDKHXWF0d/G7AFtGLoO2L1edtOangVDeR1ZJgh1mmFXUuitB5b+iJmyUrIGD
	 1om9OwDthHNzJKS3wDTnZJNV07xTq3P9/8A4lhV52Sg4Lva8FVH9YiZdVuoQVqovlA
	 bc4w3VNYv1+rXvG9tKQNc2DSdJjh9lCb538Zl+LlPR7a6hM8eouvIHnp7+ghmFhYT4
	 QvOIDFKp+0ylSSfErVOAoxUzSU1+/c+xq4CkQw2BOf69RlwcVdbdjuABim9uhFVwAJ
	 RXF8Sk6VBcRO9LS4IHw2Oh+UgsjCHiuA/xJzxpHj3731xgVkcfwOMsJexxODC1JjBE
	 3n9RAFRWrUyEQ==
Date: Tue, 12 May 2026 08:12:18 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v10 1/9] revocable: Revocable resource management
Message-ID: <agLg4kkovm0VBLfO@google.com>
References: <20260508105448.31799-1-tzungbi@kernel.org>
 <20260508105448.31799-2-tzungbi@kernel.org>
 <CAMRc=McRGoKdbpwyMO5x-Ttyr2n7+Chd8F2jwBF8j33SvNAGcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McRGoKdbpwyMO5x-Ttyr2n7+Chd8F2jwBF8j33SvNAGcg@mail.gmail.com>

On Mon, May 11, 2026 at 06:16:52AM -0700, Bartosz Golaszewski wrote:
> I have not looked into the implementation details all that much - that can
> always be ironed out later - but for the API part: I quite like it now. The
> resulting GPIO code looks cleaner and I think it's worth adding or v7.2.
> 
> Thanks for addressing the issues and perseverence.

Thank you for taking the time to review the APIs.  I'm glad you found the
changes to be an improvement!
