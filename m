Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205B3955C7;
	Fri,  9 Oct 2026 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561517; cv=none; b=RQJPTAYUm3uZGVtjSl+YM585Uo6/2/lqxkCMz0FeIhP4OBqpqglwXP/VZz2ArXzDhWJmEkpffOP65eo63WMNwdv6jIvkbu7Qv+9ZWjAwQVAlWKw9IzQV/wdsyodmcYzkhG5rcjiW4dycV4DFOD4ReB/Ol5MW2O/HDOM37mYka8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561517; c=relaxed/simple;
	bh=CiPNIPKWWOYU918dLTsOETBW0Z4xb8GjgmL/uqFlFmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RFMcFttQYJ5nVrx/G0K5ZhSRq0zpmCjCZhAOSbUa/i3r2cL26oB9p2PbQbZg++nRoktm7VJAqI4Xe9oVHYy+MdCYqm0xMm4WYaMI/KWJf4NUxJFfn3FcuYQkbu1SIS1zgFN1DZ/lWbfbXW1cIQnF7oWlRufF5nqv8j4l2AVhVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.104] (91.78.20.251) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 9 Oct
 2026 18:58:22 +0300
Message-ID: <65555593-0e68-4769-bb7e-2737ba7050d1@omp.ru>
Date: Fri, 9 Oct 2026 18:58:21 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: core: fix pin name leak on radix_tree_insert()
 error path
To: Haotian Zhang <vulab@iscas.ac.cn>, Linus Walleij <linusw@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261009054556.3151123-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20261009054556.3151123-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 10/09/2026 15:30:13
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 206574 [Oct 09 2026]
X-KSE-AntiSpam-Info: Version: 6.1.1.27
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 127 0.3.127
 0884f7b061fa529b810563f359267cd65d2ec05c
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {diag_burst_silent}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 91.78.20.251
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/09/2026 15:38:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/9/2026 1:04:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 10/9/26 8:45 AM, Haotian Zhang wrote:

> pinctrl_register_one_pin() allocates pindesc->name with kasprintf() when
> the pin has no static name, and marks it with pindesc->dynamic_name.  If
> the subsequent radix_tree_insert() fails, the function jumps to the
> failed label, which only calls kfree(pindesc) and never frees the
> dynamically allocated name, leaking it.
> 
> Since the insertion failed, the pin is not in the radix tree, so the
> caller's pinctrl_free_pindescs() cleanup cannot find it and cannot
> release the name either.
> 
> Release pindesc->name on the failed path when it was dynamically
> allocated.
> 
> Fixes: ecfe9a015d3e ("pinctrl: core: handle radix_tree_insert() errors in pinctrl_register_one_pin()")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
   Oops, my fault indeed! :-(   If you want, you can add my:
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 1675dd36bd5c..3a1d1ff871ef 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -249,6 +249,8 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
>         return 0;
> 
>  failed:
> +       if (pindesc->dynamic_name)
> +               kfree(pindesc->name);

   You may as well add another label here -- for the 1st *goto*...

>         kfree(pindesc);
>         return error;
>  }
[...]
MBR, Sergey

