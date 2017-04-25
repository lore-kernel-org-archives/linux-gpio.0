From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH 6/8] selftests: splice: override clean in lib.mk to fix
 warnings
Date: Tue, 25 Apr 2017 09:03:03 -0600
Message-ID: <068a4a67-5858-5c4c-00ce-859ac8c39687@osg.samsung.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
 <18f3784fe7bf463595f7261fb4e8e9fd6548b0d5.1492815938.git.shuahkh@osg.samsung.com>
 <87tw5hyp7z.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:52398
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1948550AbdDYPDI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Apr 2017 11:03:08 -0400
In-Reply-To: <87tw5hyp7z.fsf@concordia.ellerman.id.au>
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
>> Makefile:8: warning: overriding recipe for target 'clean'
>> ../lib.mk:55: warning: ignoring old recipe for target 'clean'
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>  tools/testing/selftests/splice/Makefile | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/splice/Makefile b/tools/testing/selftests/splice/Makefile
>> index 559512c..3f967ba 100644
>> --- a/tools/testing/selftests/splice/Makefile
>> +++ b/tools/testing/selftests/splice/Makefile
>> @@ -4,5 +4,6 @@ all: $(TEST_PROGS) $(EXTRA)
>>  
>>  include ../lib.mk
>>  
>> -clean:
>> +override define CLEAN
>>  	rm -fr $(EXTRA)
>> +endef
> 
> Could just be:
> 
> EXTRA_CLEAN := $(EXTRA)
> 

Will send v2 with this change.

-- Shuah

