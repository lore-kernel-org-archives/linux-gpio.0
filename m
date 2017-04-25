From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH 7/8] selftests: sync: override clean in lib.mk to fix
 warnings
Date: Tue, 25 Apr 2017 09:03:24 -0600
Message-ID: <476527ab-aedc-c0b4-debb-2843ce1345d6@osg.samsung.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
 <dc66a97137df1b6a913463775466a96e0f3c13db.1492815938.git.shuahkh@osg.samsung.com>
 <87r30lyp75.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:52421
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1948614AbdDYPD1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Apr 2017 11:03:27 -0400
In-Reply-To: <87r30lyp75.fsf@concordia.ellerman.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, dvhart@infradead.org
Cc: viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, shuah Khan <shuahkh@osg.samsung.com>

On 04/21/2017 11:41 PM, Michael Ellerman wrote:
> Shuah Khan <shuahkh@osg.samsung.com> writes:
> 
>> Add override for lib.mk clean to fix the following warnings from clean
>> target run.
>>
>> Makefile:24: warning: overriding recipe for target 'clean'
>> ../lib.mk:55: warning: ignoring old recipe for target 'clean'
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>  tools/testing/selftests/sync/Makefile | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/sync/Makefile b/tools/testing/selftests/sync/Makefile
>> index 87ac400..f7d250d 100644
>> --- a/tools/testing/selftests/sync/Makefile
>> +++ b/tools/testing/selftests/sync/Makefile
>> @@ -20,5 +20,6 @@ TESTS += sync_stress_merge.o
>>  
>>  sync_test: $(OBJS) $(TESTS)
>>  
>> -clean:
>> +override define CLEAN
>>  	$(RM) sync_test $(OBJS) $(TESTS)
>> +endef
> 
> EXTRA_CLEAN := sync_test $(OBJS) $(TESTS)
> 

Will send v2 with this change.

-- Shuah

