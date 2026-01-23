Received: from torres.zugschlus.de (torres.zugschlus.de [81.169.166.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F936BCDC;
	Fri, 23 Jan 2026 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.169.166.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164878; cv=none; b=W1UFUv5o/vingi1a+pyI5gxVTQzW5HGhBa5VwO0ZKtbq+WSg6xLQdjk4W/boSSg+EeL30oxmEmWa/pVK6oKp/BMgxZO5GoVad03gT1xHn7gf5TDf0CwRr4xSNYaeLiaMvdXF666KrJlDmB9Pg0GpG0/PSO4mgohSnXIpmJZnNa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164878; c=relaxed/simple;
	bh=w3gEAj/uQod59uT0Ysjqg55prAg1QNpJU/4l7V6qKWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BMuMUrlBgqI5ORQ+2QyrvWtuhW0EWut/7mMyuHZAWzlc6V5o50vxNZw7OAlDhzwvEY9WUjG8pnqPCqJ2H3Zc/TGUwx2FOZBhwfHtIy1gJIHuQAEl4x5iwAt+RpbPLbgXHAFExiJGGVYwi0v3n6qOKYlQ07Cy+Uuws0GJGIm9RBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de; spf=pass smtp.mailfrom=zugschlus.de; arc=none smtp.client-ip=81.169.166.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zugschlus.de
Received: from mh by torres.zugschlus.de with local (Exim 4.98.2)
	(envelope-from <mh+linux-kernel@zugschlus.de>)
	id 1vjEKo-00000006bHH-1e0a;
	Fri, 23 Jan 2026 11:24:10 +0100
Date: Fri, 23 Jan 2026 11:24:10 +0100
From: Marc Haber <mh+linux-kernel@zugschlus.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: regression 6.18.>4 gpio-keys-polled: failed to get gpio state: -52
Message-ID: <aXNMSu0RnhTI4BZ1@torres.zugschlus.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

@Bartosz, I have added you because you did some work on the gpio stuff 
in 6.18.

I run one APU box with latest gerne, and since I booted into 6.18.4 on 
January 9, I get multiple entries per second like
Jan 23 11:19:20 prom kernel: gpio-keys-polled gpio-keys-polled: failed to get gpio state: -52

This also applies to 6.18.6. 6.18.3 was still fine.

Do you have any idea what might be causing this and how to fix?

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
