Received: from mail11 (ip-86-49-165-115.net.vodafone.cz [86.49.165.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFAE3D812D;
	Tue,  1 Sep 2026 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=86.49.165.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273912; cv=none; b=LB3AbeCNWH+PJfTuH9KeNnX0ff7LZHFQgpa+yggyn1UC0Y4DOIY7B/6dHrVXh49o3oT4zEiv2fUdrw2FVbOdUFKNA95loKjSZ+Hu3TGi0rcFJXroJnHIcj8CTkzHveNkrbeVv927IULEnmJaRp4JtGqLI3oqhN7RlyEJHtgQXMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273912; c=relaxed/simple;
	bh=3TO/JRXWHQLAOZa9Zw+7bMHQ6SWuQth9E3yv/I3AJm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cg/t5nbufNV5e4eq1OMFWLGsRRsXeUquxN4ok/a1JCufvNoKCNtJZXZWtYhu/xmPentgYN7uegGZ4Oa3WbgVyAK+9o8YEeG4a0CwD92ZCwRpaqU/nUIUoK5qYpIXaFIkQgW/9i33UQai+MHT4Bl7S+VyKh02X6lLjce3ERHZkgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lipicko.cz; spf=pass smtp.mailfrom=lipicko.cz; dkim=pass (2048-bit key) header.d=lipicko.cz header.i=@lipicko.cz header.b=vcqPSjC0; arc=none smtp.client-ip=86.49.165.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lipicko.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lipicko.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lipicko.cz header.i=@lipicko.cz header.b="vcqPSjC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lipicko.cz; s=mail;
	t=1788273901; bh=3TO/JRXWHQLAOZa9Zw+7bMHQ6SWuQth9E3yv/I3AJm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:From:
	 Sender:To:CC:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Reply-To;
	b=vcqPSjC0Vy42iga4C9k9/jjnoEQwVrboWafhGV0yb4y9sAha/950VgUtWmO0+sWT5
	 rvgUmsau/TgMcqlzmLh8+18Lov3l0ThZHBhMZA1POC36qCGVZRfT488j73KfjdGZUw
	 gzVKEsXaq0ZvqLBb3gaExJy2MJU7h9avQwFgqG8gKuUI4SfxJevPJ5UTh5cpVecmN8
	 6r2HSMWU8l8SOSEDyi/kRe6XLDhDveRZQngIHoYcCv4dtyfcyJXFtjrrZoPDLxhzIW
	 rlTgR052gWd2hzHA1N8ie3woUU5WLe6qpj7NUW+Z1jtU9C2sp5I1zlfV5IOsy9VkAI
	 gmjKOJuaGVrEQ==
Received: from [192.168.11.133] (siemens-ex975lvv1e-68a40ebdecb9.lipicko.cz [192.168.11.133])
	by mail11 (Postfix) with ESMTP id 81D283E0248;
	Tue, 01 Sep 2026 16:45:00 +0200 (CEST)
Message-ID: <db3800c9-bb97-4d59-a3f7-aa9631773035@lipicko.cz>
Date: Tue, 1 Sep 2026 16:45:00 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: intel: Try to retrieve driver data for
 pure platform drivers
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 =?UTF-8?Q?Radek_V=C3=A1lko?= <rvalko@lipicko.cz>
References: <20260831142853.1995573-1-andriy.shevchenko@linux.intel.com>
 <20260831142853.1995573-3-andriy.shevchenko@linux.intel.com>
 <20260901102428.GH106095@black.igk.intel.com>
 <CAHp75Vd0weJnX2yb4XY8br6xD4gUA0dogzyg7-KNuynOtXnziw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Radek_V=C3=A1lko?= <rvalko@lipicko.cz>
In-Reply-To: <CAHp75Vd0weJnX2yb4XY8br6xD4gUA0dogzyg7-KNuynOtXnziw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


I test it hopefully tomorrow and will let you know.

Thanks.

Radek

On 9/1/26 12:27, Andy Shevchenko wrote:
> On Tue, Sep 1, 2026 at 1:24 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
>> On Mon, Aug 31, 2026 at 04:25:47PM +0200, Andy Shevchenko wrote:
>>> The Denverton pinctrl device can be instantiated by the Intel LPC
>>> driver as an MFD platform device named "denverton-pinctrl".
> ...
>
>>> +static const struct intel_pinctrl_soc_data *
>>> +intel_pinctrl_get_soc_data_by_hid(struct platform_device *pdev)
>> pdev can be const, no?
> Yes, but it will require also to change the existing prototype for
> _uid case. After I get a confirmation the fix works I will issue a v2
> with an additional patch included.
>
