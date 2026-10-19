Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE694C4F79
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408429; cv=none; b=aX4XBCZ14vgHZNON/4glh+wJUmG30MIhxSOVtUcwHSdORgog9ga6vyu0MOSOv8+omvg4Gp6kkKGTTHWE+Rd+RWX/oHgw0w5c1MEYeVaervYS+hB8c/zbvSgrEu+gisUwps53+NkjW4HSVjrc2weG49a4R6xiWfU9CnX2hprY9ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408429; c=relaxed/simple;
	bh=/suRyJ16E0iN9UC0mV1XAKeO/uuNbRvn47a+AdABwVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzSD0ITztOx9TBiQWsS1QRQjlZR7Zx/J5r6h+3aeJN1yH3Y78bWRqPs8yypLXpS+HBjO+MC9N4/IQL+DeyXXyZBxB5S0Luemdha0SthZxCYmkVDRqAVzxJK/SWOzmHqFB7j3W4/eXuSxVXKtdTPKhEnlJ2k5VYSsHoqxkPNy6ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWXeHHwu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWXeHHwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792408428; x=1823944428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/suRyJ16E0iN9UC0mV1XAKeO/uuNbRvn47a+AdABwVI=;
  b=UWXeHHwuA+ElKm5zYEUZFz/rY0IQaZYwOmqixaTv1xKpx41AZ4HqBCez
   GnkTbBjRAiwqZs2LkuEGRY/rkbZUPCjx8H2n0ZJoyVCIa+/04m0nJmBtr
   w1nQ/72vFUYkQvBFEe6bXM5HG11vc59f5h7zGjin8C0QYM2RIG+xoMY4/
   O/UOgTMaZOL/AenojVyimnSXysoAI8TC4XHebukD6SwBNu+VmOdcmTYug
   leFNGkmOMVmRdHNjLWbr/1R9ZBvV+OVLZVeeEVZDnPJp7DKX/Vj6GeSjb
   QLkQVKynFUH/MR0W6mk95KiQDbFJ+ZLOgGv0vIHwC+tfx7yI9n8Gk0N8E
   g==;
X-CSE-ConnectionGUID: 8Znpt2agRVGzcme1TlgVxg==
X-CSE-MsgGUID: YcR74lGHRR6HLI6SImBTrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="981763"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="981763"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 04:13:47 -0700
X-CSE-ConnectionGUID: M4tB0hbsSPiQIRUQ9Tx/Qw==
X-CSE-MsgGUID: 5WQjO4VsTp6Mb5Z3oFF4Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2911603"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 04:13:46 -0700
Date: Mon, 19 Oct 2026 14:13:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [PATCH RFC libgpiod 2/3] tools: factor out line event formatting
 into tools-common
Message-ID: <atX7Z9qd_plw-Waw@ashevche-desk.local>
References: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
 <20261016-gpioctl-v1-2-8770622679b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-gpioctl-v1-2-8770622679b8@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 16, 2026 at 04:18:09PM +0200, Bartosz Golaszewski wrote:
> Move helpers used by gpiomon for formatting of line events and printing
> of the help text for format specifiers to tools-common so that both
> gpiomon and the upcoming gpioctl can reuse the same code.

...

> +void print_event_format_help(bool include_line_chip)
> +{
> +	printf("\n");

This is really confusing. If you want to separate, do it in the caller.

> +	printf("Format specifiers:\n");
> +	printf("  %%o   GPIO line offset\n");

> +	if (include_line_chip) {
> +		printf("  %%l   GPIO line name\n");
> +		printf("  %%c   GPIO chip name\n");
> +	}

Hmm... Personally I don't like such an approach. The alternatives are:
- having 3 (if the order is strictly requested like this) or 2 helpers and
split the function to two instead of boolean parameter.

> +	printf("  %%e   numeric edge event type ('1' - rising or '2' - falling)\n");
> +	printf("  %%E   edge event type ('rising' or 'falling')\n");
> +	printf("  %%S   event timestamp as seconds\n");
> +	printf("  %%U   event timestamp as UTC\n");
> +	printf("  %%L   event timestamp as local time\n");
> +}

...

> +void print_event(uint64_t timestamp_ns, unsigned int offset, int event_type,
> +		 int timestamp_fmt, const char *fmt,
> +		 const char *line_name, const char *chip_name, bool unquoted)
> +{
> +	const char *prev, *curr;
> +	char spec;
> +
> +	if (!fmt) {
> +		print_event_time(timestamp_ns, timestamp_fmt);
> +		if (event_type == GPIOD_EDGE_EVENT_RISING_EDGE)
> +			fputs("\trising\t", stdout);
> +		else
> +			fputs("\tfalling\t", stdout);

> +		if (!line_name) {
> +			if (chip_name)
> +				printf("%s %u", chip_name, offset);
> +			else
> +				printf("%u", offset);
> +		} else {
> +			if (chip_name)
> +				printf("%s %u ", chip_name, offset);
> +			printf(unquoted ? "%s" : "\"%s\"", line_name);
> +		}

Independently on the original code, I would go with positive test

		if (line_name) {
			...
		} else {
			...
		}

> +		fputc('\n', stdout);
> +		return;
> +	}

> +	for (prev = curr = fmt;;) {
> +		curr = strchr(curr, '%');
> +		if (!curr) {
> +			fputs(prev, stdout);
> +			break;
> +		}
> +
> +		if (prev != curr)
> +			fwrite(prev, curr - prev, 1, stdout);
> +
> +		spec = *(curr + 1);
> +
> +		switch (spec) {
> +		case 'c':
> +			fputs(chip_name ? chip_name : "unknown", stdout);
> +			break;
> +		case 'e':
> +			printf("%d", event_type);
> +			break;
> +		case 'E':
> +			fputs(event_type == GPIOD_EDGE_EVENT_RISING_EDGE ?
> +			      "rising" : "falling", stdout);
> +			break;
> +		case 'l':
> +			fputs(line_name ? line_name : "unnamed", stdout);
> +			break;
> +		case 'L':
> +			print_event_time(timestamp_ns, 2);
> +			break;
> +		case 'o':
> +			printf("%u", offset);
> +			break;
> +		case 'S':
> +			print_event_time(timestamp_ns, 0);
> +			break;
> +		case 'U':
> +			print_event_time(timestamp_ns, 1);
> +			break;
> +		case '%':
> +			fputc('%', stdout);
> +			break;
> +		case '\0':
> +			fputc('%', stdout);
> +			goto end;
> +		default:
> +			fwrite(curr, 2, 1, stdout);
> +			break;
> +		}

> +		curr += 2;
> +		prev = curr;

Can be in for-line.

> +	}
> +
> +end:
> +	fputc('\n', stdout);
> +}

-- 
With Best Regards,
Andy Shevchenko


