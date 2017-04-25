From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH 4/8] selftests: gpio: override clean in lib.mk to fix
 warnings
Date: Tue, 25 Apr 2017 09:02:02 -0600
Message-ID: <f95aeee4-a5cf-6b66-c451-eac059cb0ca6@osg.samsung.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
 <b216b1808abff1e75c1b325a338a518b8477257a.1492815938.git.shuahkh@osg.samsung.com>
 <87wpadyp8r.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:52362
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1948640AbdDYPCM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Apr 2017 11:02:12 -0400
In-Reply-To: <87wpadyp8r.fsf@concordia.ellerman.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, dvhart@infradead.org
Cc: viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, shuah Khan <shuahkh@osg.samsung.com>

On 04/21/2017 11:40 PM, Michael Ellerman wrote:
> Shuah Khan <shuahkh@osg.samsung.com> writes:
> 
>> Add override for lib.mk clean to fix the following warnings from clean
>> target run.
>>
>> Makefile:11: warning: overriding recipe for target 'clean'
>> ../lib.mk:55: warning: ignoring old recipe for target 'clean'
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>  tools/testing/selftests/gpio/Makefile | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
>> index 205e4d1..4f6d9e0 100644
>> --- a/tools/testing/selftests/gpio/Makefile
>> +++ b/tools/testing/selftests/gpio/Makefile
>> @@ -7,8 +7,9 @@ include ../lib.mk
>>  
>>  all: $(BINARIES)
>>  
>> -clean:
>> +override define CLEAN
>>  	$(RM) $(BINARIES)
>> +endef
> 
> This could be achieved more simply with:
> 
> EXTRA_CLEAN := $(BINARIES)
> 

gpio clean requires special handling. I have one more patch
I sent out that handles that. So I am going to leave this
patch the way with override.

thanks,
-- Shuah


